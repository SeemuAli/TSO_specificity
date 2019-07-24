
#filter combined vcf to pull out GIAB sample 
/share/apps/bcftools-distros/bcftools-1.8/bcftools view -s 18M01315 /data/results/190607_D00501_0322_BHYML5BCX2/IlluminaTruSightOne/190607_D00501_0322_BHYML5BCX2_filtered_annotated_roi.vcf > bcf_18M01315.vcf \

#index vcf 
/data/diagnostics/scripts/validateVCF.sh bcf_18M01315.vcf \

#remove non variant sites 
/share/apps/GATK-distros/gatk-4.1.2.0/gatk SelectVariants -V bcf_18M01315.vcf  -R /data/db/human/gatk/2.8/b37/human_g1k_v37.fasta --exclude-non-variants --output noV_18M01315.vcf \



#create vcf evaluating concordance 

/share/apps/GATK-distros/gatk-4.1.2.0/gatk Concordance \
       -eval noV_18M01315.vcf \
       -S /export/home/sa/tso_spec/test/summary_concord.txt \
       --truth /data/db/human/giab/3.3.2//HG001_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X-SOLID_CHROM1-X_v.3.3.2_highconf_PGandRTGphasetransfer.vcf.gz \
       --disable-sequence-dictionary-validation true \
       --true-positives-and-false-negatives TPFN_18M01315.vcf \
       --true-positives-and-false-positives TPFP_18M01315.vcf \
       -ftnfn TNFN_18M01315.vcf \
       --intervals /data/results/190607_D00501_0322_BHYML5BCX2/IlluminaTruSightOne/18M01315/18M01315_gt_eq_20x.bed \
       --filter-analysis TNFN_filter_table.txt




# check the filters used for vcf -- all fiteres applied to the passed variants 
# cat noV_18M01315.vcf | grep -v "^#" | cut -f 7 | sort | uniq -c. 


# cat /data/results/190607_D00501_0322_BHYML5BCX2/IlluminaTruSightOne/190607_D00501_0322_BHYML5BCX2_filtered_annotated_roi.vcf | grep -v "^#" | cut -f 7 | sort | uniq -c  

# cat noV_18M01315.vcf | grep -v "^#" | cut -f 7 | sort | uniq -c

'''
18M01315: 
	 13 FS
      5 FS;MQ
      1 FS;MQ;QD
      3 FS;QD
    136 InbreedingCoeff
     17 InbreedingCoeff;QD
      5 LowQual
      2 LowQual;MQ
      5 LowQual;QD
    103 MQ
     38 MQRankSum
      4 MQRankSum;QD
  10339 PASS
    140 QD
'''