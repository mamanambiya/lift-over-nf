nextflow.enable.dsl=2

process getChainFile {
    storeDir params.chain_cache_dir

    output:
    path "*.chain.gz"

    script:
    """
    #!/usr/bin/env python
    from pyliftover.chainfile import open_liftover_chain_file

    open_liftover_chain_file("${params.from}", "${params.to}", cache_dir=".", search_dir=None)
    """
}

process liftOver {
    publishDir params.out_dir, mode: "copy"

    input:
    path chainfile
    path bed_file

    output:
    file "*.${params.to}.bed"

    script:
    """
    liftOver -bedPlus=6 ${bed_file} ${chainfile} ${bed_file.getBaseName()}.${params.to}.bed unmapped.bed
    """
}

workflow {
    bed_files = Channel.fromList(file(params.bed_list, checkIfExists: true).readLines())
    getChainFile()
    liftOver(getChainFile.out, bed_files)
}