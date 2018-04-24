#!/usr/bin/env cwl-runner
# This tool description was generated automatically by argparse2tool ver. 0.4.3-2
# To generate again: $ gemBS index --generate_cwl_tool
# Help: $ gemBS index --help_arg2cwl

cwlVersion: v1.0

requirements:
  - class: InlineJavascriptRequirement
  - class: InitialWorkDirRequirement
    listing: 
      - $( inputs.input )

hints:
  - class: ResourceRequirement
    coresMin: 1
    ramMin: 4092
    outdirMin: 512000
#  - class: DockerRequirement
#    dockerPull: "quay.io/biocontainers/samtools:1.3.1--5"


class: CommandLineTool
baseCommand: ['gemBS', 'index']

doc: |
  Index genomes

inputs:
  
  input:
    type: File
    doc: Path to a single fasta reference genome file.
    inputBinding:
      position: 5
      prefix: --input
      valueFrom: $(self.basename)

  threads:
    type: ["null", string]
    doc: Number of threads. By default GEM indexer will use the maximum available on the system.
    inputBinding:
      position: 5
      prefix: --threads 


outputs: 
  gemBSreference:
    type: File
    outputBinding:
      glob: "*.BS.gem"

  gemBSinfo:
    type: File
    outputBinding:
      glob: "*.BS.info"
