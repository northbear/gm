# Task 2


Create a Ubuntu docker based application that collects a process network statistics about all host’s
processes that opened ports and established connection and to export this information in runtime into
Excel sheet with next columns “Process Create Time”, &quot;PID&quot; , &quot;Process Name&quot;, &quot;Local Address&quot;, &quot;Local
Port&quot;, &quot;Remote Address&quot;, &quot;Remote Port&quot;. You can implement it on your preferable programming
language.

## Implementation

Host network connections can be available by using docker option `--network host`. it makes a container attached
to a default network namespace of the host. Then host network connections data can be reachable, particulary by
linux shell command `ss` or `netstat` (legacy).
But the container processes cannot reach the host processes details, like pid, creation time and so on without
hacking linux security subsystem (cgroups) and/or using an agent that will berun on the host and provide data
that is unavailable inside containers.

## Questions and Answers

Answer the following questions:

### What is a main problem to collect a process network statistic?

A container should be run with additional parameters that in common case (using in a cloud) are not available
for non-admin users.

### What do you have to know about docker network environment?
