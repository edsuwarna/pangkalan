#!/bin/bash -x

# Install Node_exporter
curl -LO https://github.com/prometheus/node_exporter/releases/download/v1.5.0/node_exporter-1.5.0.linux-amd64.tar.gz
tar -xvf node_exporter-1.5.0.linux-amd64.tar.gz
sudo mv node_exporter-1.5.0.linux-amd64/node_exporter /usr/local/bin
sudo rm -rf node_exporter-1.5.0.linux-amd64
sudo rm -rf node_exporter-1.5.0.linux-amd64.tar.gz

# Copy node exporter service file to systemd
sudo cp node_exporter.service /etc/systemd/system

# Reload system daemon, enable the node exporter service to the system startup and start node exporter service
sudo systemctl daemon-reload
sudo systemctl enable node_exporter
sudo systemctl start node_exporter