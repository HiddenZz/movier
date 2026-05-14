package org.downloader.feature.progress.model;

import lombok.Builder;

@Builder
public record CompletedResultEvent(long tmdbId, String contentUuid, String minioPath) {
}
