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
    { "nvram_init",      AID_NVRAM,   0 },

#define CONTROL_PERMS_APPEND \
    { "md_minilog_util", AID_RADIO, AID_RADIO}, \
    { "muxreport-daemon", AID_RADIO, AID_RADIO }, \
    { "sysctl", AID_SHELL, AID_SHELL},
#endif /* DEVICE_PERMS_H */