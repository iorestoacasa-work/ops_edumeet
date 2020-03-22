#!/usr/bin/env python

import subprocess
import json

tf_json = subprocess.check_output("terraform show -json", shell="bash")
data = json.loads(tf_json)

servers = data['values']['root_module']['resources']

for tf_srv in servers:
    srv = tf_srv['values']
    dns_record = "%(name)s A %(ipv4_address)s" % srv
    gandi_cmd_prefix = "gandi dns create iorestoacasa.work "
    subprocess.check_output(gandi_cmd_prefix + dns_record, shell="bash")
    print("Created record %s" % dns_record)
    dns_record = "%(name)s AAAA %(ipv6_address)s" % srv
    subprocess.check_output(gandi_cmd_prefix + dns_record, shell="bash")
    print("Created record %s" % dns_record)

