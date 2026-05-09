-- Purpose: Phase 05 verification checks pre/post apply.
-- Execution order: after 03/04 and after 07/09.

USE peq;

SELECT COUNT(*) AS update_candidates
FROM _tmp_nc_preview
WHERE review_status IN (EXACT_MATCH,NEAR_MATCH);

SELECT COUNT(*) AS no_source_candidates
FROM _tmp_nc_preview
WHERE review_status = NO_SOURCE;
