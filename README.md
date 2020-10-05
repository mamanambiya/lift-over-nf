# lift-over-nf
Nextflow pipeline using the UCSC [liftOver](https://genome.ucsc.edu/cgi-bin/hgLiftOver) tool to translate bedfiles from one reference genome to another. 
Chain files are automatically downloaded by the pipeline, and are stored in a permanent cache for later re-use.

## Usage

The pipeline is run using [Nextflow](https://www.nextflow.io/), which will need to be installed prior to use. To run the pipeline, use the command

```bash
nextflow run oalmelid/lift-over-nf --from <start-genome> --to <end-genome> --bed_list <file with list of bedfiles to process> -profile <docker|singularity|conda>
```

The pipeline can be run either on the base system if the ucsc liftOver tool is already installed, or using one of the configuration profiles for docker, singularity or conda. 
For the purpose of reproducibility, it is recommended that you use either docker or singularity if possible.

### Configuration parameters

Currently, lift-over-nf takes the following configuration parameters:

| Parameter | Default value | Description |
| :---  | :---  | :-----  |
| bed_list | `""` | File with list of bed files to be transcribed, one filename per line |
| from | `""` | Reference genome of input bed files (e.g. `"hg19"`) | 
| to | `""` | Reference genome to be output (e.g. `"hg38"`) | 
| chain_cache_dir | `"${launchDir}/chain_files/"` | Cache directory for chain files | 
| out_dir | `"${launchDir}/output/"` | Directory to store processed files in |

## Licensing

The pipeline is licensed under the MIT license. See [LICENSE](LICENSE) for terms.
