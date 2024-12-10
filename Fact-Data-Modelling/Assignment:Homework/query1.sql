/*A query to deduplicate game_details from Day 1 so there's no duplicates
 First step is to identify duplicate rows in the game_details table */
 
-- 'id' column must be unique or the primary key
WITH ranked_rows AS (
    SELECT 
        id,
        ROW_NUMBER() OVER (PARTITION BY game_id, team_id, player_id ORDER BY id) AS row_num
    FROM game_details
)

--Step 2 to ensure there are no duplicate id values
SELECT id, COUNT(*)
FROM game_details
GROUP BY id
HAVING COUNT(*) > 1;

-- Step 3: Delete duplicate rows while retaining the first occurrence (row_num = 1)
DELETE FROM game_details
WHERE id IN (
    SELECT id
    FROM ranked_rows
    WHERE row_num > 1
);