/*
 *  Copyright (C) 2014 The OmniROM Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef DEVICE_PERMS_H
#define DEVICE_PERMS_H

#define PROPERTY_PERMS_APPEND \
    { "nvram_init",      AID_NVRAM,   0 }, \
    { "persist.ril.",     AID_RADIO,    0 }, \
    { "persist.ril.cfu.querytype", AID_APP,   0 }, \
    { "mux.",             AID_RADIO,    0 }, \
    { "mux.",             AID_SYSTEM,   0 }, \
    { "mtk_telephony_mode_slot1",             AID_SYSTEM,   0 }, \
    { "mtk_telephony_mode_slot2",             AID_SYSTEM,   0 }, \
    { "net.",             AID_DHCP,   0 }, \
    { "gps.",             AID_GPS,     AID_SYSTEM }, \
    { "persist.af.",      AID_MEDIA,   0 }, \
    { "af.",              AID_MEDIA,   0 }, \
    { "a2dp.",            AID_MEDIA,   0 }, \
    { "streamin.",        AID_MEDIA,   0 }, \
    { "streamout.",       AID_MEDIA,   0 }, \
    { "bwc.mm.",          AID_MEDIA,   0 }, \
    { "mediatek.",        AID_RADIO,   0 }, \
    { "bt.",        AID_BLUETOOTH,    0 }, \
    { "persist.bt.",      AID_BLUETOOTH,    0 }, \
    { "persist.mtk.wcn.combo.",        AID_SYSTEM,    0 }, \
    { "persist.mtklog.",  AID_SHELL,   0 }, \
    { "ter.",             AID_RADIO,    0 }, \
    { "persist.ter.",     AID_RADIO,    0 }, \
    { "media.wfd",  AID_SYSTEM,   AID_MEDIA }, \
    { "wfd.",  AID_SYSTEM,   AID_MEDIA }, \
    { "gps.",             AID_GPS,     AID_SYSTEM }, \
    { "bgw.", 				AID_SYSTEM,    0 }, \
    { "cdma.",        AID_RADIO,    0 },  

#define CONTROL_PERMS_APPEND \
    { "md_minilog_util", AID_RADIO, AID_RADIO}, \
    { "muxreport-daemon", AID_RADIO, AID_RADIO }, \
    { "sysctl", AID_SHELL, AID_SHELL},
#endif /* DEVICE_PERMS_H */