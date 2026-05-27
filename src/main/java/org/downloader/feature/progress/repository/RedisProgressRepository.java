package org.downloader.feature.progress.repository;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.downloader.feature.progress.model.Progress;
import org.downloader.feature.progress.model.ProgressType;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Repository;

import java.time.Duration;
import java.util.Optional;


@AllArgsConstructor
@Repository
@Slf4j
public class RedisProgressRepository implements ProgressRepository {

    private final StringRedisTemplate redis;

    @Override
    public void set(Progress progress, ProgressType type) {
        redis.opsForHash().put(
                headKeyBuilder(type, progress.tmdbId()),
                key(progress.contentUuid(), progress.quality()),
                String.valueOf(progress.progress())
        );

        redis.expire(headKeyBuilder(type, progress.tmdbId()), Duration.ofHours(24));


        log.info("{} progress {}% for {}", type.name(), progress.progress(), progress.tmdbId());
    }

    @Override
    public void invalidate(ProgressType type, long tmdbId, String contentUuid, String quality) {
        redis.opsForHash().delete(headKeyBuilder(type, tmdbId), key(contentUuid, quality));
    }

    private String headKeyBuilder(ProgressType type, long tmdbId) {
        return "progress:%s:%s".formatted(type.name(), tmdbId);
    }


    private String key(String contentUuid, String quality) {
        return "%s:%s".formatted(contentUuid, Optional.ofNullable(quality).orElse("none"));
    }
}
