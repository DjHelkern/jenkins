-- SELECT fr.rfam_acc, fr.rfamseq_acc, fr.seq_start, fr.seq_end
-- FROM full_region fr, rfamseq rf, taxonomy tx
-- WHERE rf.ncbi_id = tx.ncbi_id
-- AND fr.rfamseq_acc = rf.rfamseq_acc
-- AND tx.ncbi_id = 10116 -- NCBI taxonomy id of Rattus norvegicus
-- AND is_significant = 1 -- exclude low-scoring matches from the same clan

SELECT fr.rfam_acc, fr.rfamseq_acc, fr.seq_start, fr.seq_end, f.type
FROM full_region fr, rfamseq rf, taxonomy tx, family f
WHERE rf.ncbi_id = tx.ncbi_id
AND f.rfam_acc = fr.rfam_acc
AND fr.rfamseq_acc = rf.rfamseq_acc
AND tx.tax_string LIKE '%Mammalia%'
AND f.type LIKE '%snoRNA%'
AND is_significant = 1 -- exclude low-scoring matches from the same clan

