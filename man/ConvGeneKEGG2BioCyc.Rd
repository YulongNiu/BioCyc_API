% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/getBioCyc.R
\name{ConvGeneKEGG2BioCyc}
\alias{ConvGeneKEGG2BioCyc}
\title{Transfer KEGG ID to BioCyc ID.}
\usage{
ConvGeneKEGG2BioCyc(geneKEGG, speID, type = "gene")
}
\arguments{
\item{geneKEGG}{The gene symbol extract from KEGG.}

\item{speID}{The BioCyc species ID, for example "ECOLI" is for "Escherichia coli K-12 substr. MG1655".}

\item{type}{'gene' or 'protein'}
}
\value{
The BioCyc gene ID or "0", if gene is not found.
}
\description{
Convert KEGG ID to BioCyc ID.
}
\details{
Convert the KEGG gene ID to BioCyc gene ID is tricky. In BioCyc, the gene name is not in a uniform; some of them use symbol like "dnaK", but some use the KEGG ID. For genes, if symbol is given, we use 'http://biocyc.org/xmlquery?query=[x:x<-ECOLI^^genes,x^name="atpA"]&detail=full'. There are two circumstances that will return "0": one is that  BioCyc database may marker some genes as "Pseudo-Genes", and the other is different gene symbols in KEGG and BioCyc. For proteins, we at first transfer KEGG gene IDs to UniProt IDs, and then to BioCyc gene IDs.
}
\examples{
## symbol is "atpD"
ConvGeneKEGG2BioCyc('eco:b3732', 'ECOLI')

## symbol is "SMU_408" but the first annotation word is "permease"
ConvGeneKEGG2BioCyc('smu:SMU_408', 'SMUT210007')

## It will return "0" because of the symbol 'atpE_H' from KEGG.
## The symbol in BioCyc is 'atpE/H'.
ConvGeneKEGG2BioCyc('bba:Bd0010', 'BBAC264462')

## retrieve protein
ConvGeneKEGG2BioCyc('eco:b0001', 'ECOLI', type = 'protein')
}
\author{
Yulong Niu \email{yulong.niu@hotmail.com}
}
