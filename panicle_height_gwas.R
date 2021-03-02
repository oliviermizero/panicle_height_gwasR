#sorghum bicolor panicle height genowide association study
#using rMVP
install.packages('rMVP')
library(rMVP)

#hapmap
#prepare the phenotype data; then
MVP.Data(fileHMP='Finalcombined_onlySNP343.hmp.txt',
         fileHMP='height_dry.txt',
         sep.hmp=',',
         sep.phe=',',
         SNP.effect='Add',
         fileKin=FALSE,
         filePC=FALSE,
         #priority='memory',
         #maxLine=10000,
         out='mvp.hmp'
         )
#getting the genotype,phenotype,and map ready
genotype->attach.big.matrix('mvp.geno.desc')
phenotype->read.table('mvp.phe',head=TRUE)
map->read.table('mvp.geno.map',head=TRUE)

#starting the GWAS
iMVP->MVP(
  phe=phenotype,
  geno=genotype,
  map=map,
  nPC.GLM=5,
  nPC.MLM=3,
  nPC.FarmCPU=3,
  priority="speed",
  vc.method='BRENT',
  maxLoop=10,
  method.bin='static',
  threshold=0.05,
  method=c('GLM','MLM','FarmCPU')
)

