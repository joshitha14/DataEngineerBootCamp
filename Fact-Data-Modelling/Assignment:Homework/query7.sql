/* A monthly, reduced fact table DDL host_activity_reduced
    month
    host
    hit_array - think COUNT(1)
    unique_visitors array - think COUNT(DISTINCT user_id) */

-- Table to store monthly aggregated activity data for each host
CREATE TABLE host_activity_reduced (
    month DATE NOT NULL,                       
    host TEXT NOT NULL,                        
    hit_array BIGINT[] NOT NULL,              
    unique_visitors_array BIGINT[] NOT NULL,   
    PRIMARY KEY (month, host)                
);