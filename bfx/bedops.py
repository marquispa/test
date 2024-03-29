#!/usr/bin/env python

################################################################################
# Copyright (C) 2014, 2015 GenAP, McGill University and Genome Quebec Innovation Centre
#
# This file is part of MUGQIC Pipelines.
#
# MUGQIC Pipelines is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# MUGQIC Pipelines is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with MUGQIC Pipelines.  If not, see <http://www.gnu.org/licenses/>.
################################################################################

# Python Standard Modules
import re

# MUGQIC Modules
from core.job import *


def sort_bed(input_bed, output_file, other_options=""):
    command = """sort-bed {other_options}\\
    {input_bed} \\
    > {output_file}""" .format(other_options = other_options,
        input_bed = input_bed,
        output_file = output_file)

    return Job(input_files = [input_bed],
            output_files = [output_file],
            module_entries = [['bed_sort', 'module_bedops']],
            name = "bed_sort." + os.path.basename(input_bed),
            command = command
            )


def bedmap_echoMapId(bed1, bed2, output, split = True, other_options=""):
    command = """bedmap {other_options}\\
    --echo --echo-map-id\\
    {bed1}\\
    {bed2}\\
    {split}> {output}""" .format(other_options = other_options,
        bed1 = bed1,
        bed2 = bed2,
        split = " | tr '|' '\\t' " if split else "",
        output = output)

    return Job(input_files = [bed1, bed2],
            output_files = [output],
            module_entries = [['bedmap_echoMapId', 'module_bedops']],
            name = "bedmap_echoMapId." + os.path.basename(output),
            command = command
            )
