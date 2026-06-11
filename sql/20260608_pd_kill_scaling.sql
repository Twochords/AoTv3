-- Change PD task kill requirement from goalcount=1 (hidden bucket tracking)
-- to goalcount=35 (visible per-kill progress in the task window).
-- New formula: 5 kills per tier band of 10 levels (5/10/15/20/25/30/35).
-- GOAL_COUNT=35 matches band 7 (tiers 61-65 = 35% * 100).
UPDATE task_activities SET goalcount = 35 WHERE taskid BETWEEN 990201 AND 990217;
