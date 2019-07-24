
/share/apps/GATK-distros/gatk-4.1.2.0/gatk VariantsToTable \
    -R /data/db/human/gatk/2.8/b37/human_g1k_v37.fasta \
    -V /export/home/sa/tso_spec/TPFP_18M01315.vcf \
    -F CHROM \
    -F POS \
    -F ID \
    -F REF \
    -F ALT \
    -F QUAL \
    -F FILTER \
    -F AC \
    -F AF \
    -F AN \
    -F BaseQRankSum \
    -F InbreedingCoeff \
    -F MLEAF \
    -F MQ \
    -F MQRankSum \
    -F QD \
    -F ReadPosRankSum \
    -F SOR \
    -F STATUS \
    -F set \
    -F CSQ \
    -F ClippingRankSum \
    -F ExcessHet \
    -F FS \
    -F MLEAC \
    -F mcap.mcap \
    -F spidex.dpsi_max_tissue \
    -F spidex.dpsi_zscore \
    -GF DP -GF AD -GF FT -GF GQ -GF GT -GF PL \
    -O data_TPFP.table




#less TPFP_18M01315.vcf | grep "#" | --color -E "ClippingRankSum|ExcessHet|FS|MLEAC|"

#less TPFP_18M01315.vcf | grep "#INFO" | grep --color -E "AC|AF|AN|BaseQRankSum|ClippingRankSum|DP|ExcessHet|FS|InbreedingCoeff|MLEAC|MLEAF|MQ|MQRankSum|QD|ReadPosRankSum|SOR|lq|STATUS|set"

#less TPFP_18M01315.vcf | grep "#FORMAT" 

#less TPFP_18M01315.vcf | grep "#INFO" 


'''
no values in these columns; 
RAW_MQ|HaplotypeScore|DS|END|MIN_DP|RGQ|SB

everything in #INFO feild will be a -F tag 
everything in #FORMAT feild will be in -GF tag 
'''