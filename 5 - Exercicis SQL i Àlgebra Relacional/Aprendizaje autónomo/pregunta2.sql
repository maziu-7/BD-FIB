DELETE FROM DEPARTAMENTS
WHERE NUM_DPT NOT IN (SELECT NUM_DPT FROM EMPLEATS);