package org.downloader.feature.downloader.service.torrent;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.downloader.common.configuration.properties.BtProperties;
import org.downloader.common.utils.ConditionalOnTorrentProfile;
import org.downloader.feature.downloader.service.DownloaderService;
import org.downloader.feature.downloader.model.torrent.TorrentTask;
import org.downloader.feature.progress.model.ContentState;
import org.downloader.feature.progress.service.ContentStateReporterImpl;
import org.springframework.stereotype.Service;

import java.nio.file.Path;

@ConditionalOnTorrentProfile
@AllArgsConstructor
@Service
@Slf4j
public class MockTorrentDownloaderService implements DownloaderService<TorrentTask> {

    private final ContentStateReporterImpl contentStateReporterImpl;
    private final BtProperties btProperties;

    @Override
    public void accept(TorrentTask data) {
        try {

            final String uuid = data.payload().cacheGuid();
            final TorrentTask.TorrentPayload payload = data.payload();
            contentStateReporterImpl.report(ContentState.Downloading.builder()
                                                    .tmdbId(payload.tmdbId())
                                                    .contentUuid(payload.cacheGuid())
                                                    .build());

            final Path file = Path.of(btProperties.tempDir(), "test.avi");

            contentStateReporterImpl.report(ContentState.Downloaded.builder()
                                                    .tmdbId(payload.tmdbId())
                                                    .contentUuid(uuid)
                                                    .contentName(payload.title())
                                                    .filePath(file.toString())
                                                    .build());

        } catch (Exception e) {
            log.info("MockTorrentDownloaderService has error", e);
        }
    }
}
