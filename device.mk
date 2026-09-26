#
# Copyright (C) 2020 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

TARGET_TEGRA_BT     ?= btlinux
TARGET_TEGRA_HEALTH ?= nobattery

# Only include Shield apps for first party targets
include device/nvidia/shield-common/shield.mk

# Screensaver policy for a set-top box; see overlay/ for why each value differs
# from the Android TV defaults.
DEVICE_PACKAGE_OVERLAYS += \
    device/nvidia/porg/overlay

# AmbientDream, the screensaver the overlay above points at. Optional on
# purpose: a tree without vendor/jetson-tv still configures, it just has no
# dream to show.
$(call inherit-product-if-exists, vendor/jetson-tv/jetson-tv.mk)

$(call inherit-product, device/nvidia/foster/device.mk)
