package org.downloader.common.configuration.properties;

import org.springframework.boot.context.properties.ConfigurationProperties;

@ConfigurationProperties("result-publisher")
public record ResultPublisherProperties(String stream) {
}
