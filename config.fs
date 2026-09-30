# The AirPlay receiver's own uid.
#
# It cannot run as audioserver, which is what it first shipped as, and the
# reason is not permissions. libaudioclient decides by uid whether it is
# running *inside* audioserver: AudioSystem's service getters check
# `getuid() == AID_AUDIOSERVER` and, if so, skip the binder lookup and wait up
# to INT32_MAX ms for the in-process service that only audioserver itself
# installs. Any other process with that uid waits forever in
# AAudioStreamBuilder_openStream -> AudioSystem::getMmapPolicyInfos, with no
# error and no denial.
#
# Nor should it be media: audioserver trusts media (and system, and root) to
# attribute tracks and recordings to *other* uids, and this daemon parses
# untrusted network input. So it gets a uid of its own, from the range the
# platform reserves for system_ext (7500-7999), which also keeps it on the
# same partition as the binary. The generator requires the name to carry the
# partition prefix, and bionic resolves it from /system_ext/etc/passwd as
# "system_ext_airplay".
[AID_SYSTEM_EXT_AIRPLAY]
value: 7500
