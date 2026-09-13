package org.downloader.feature.progress.service;

import org.downloader.feature.progress.model.Progress;

public interface ProgressReporter {
    void set(Progress progress);

    void invalidate(long tmdbId, String contentUuid, String quality);
}
