-- Дамп данных процедуры 3wifi.show_graph_stat
CREATE PROCEDURE `show_graph_stat` (
    IN `radius` INT
)
    LANGUAGE SQL
    NOT DETERMINISTIC
 CONTAINS SQL
BEGIN
 	IF radius = 0 THEN
 		SET @tme = (SELECT `time` FROM base WHERE `time` <= NOW() ORDER BY `time` DESC LIMIT 1);
ELSE
 		SET @tme = (SELECT `time` FROM base JOIN radius_ids USING(id) WHERE `time` <= NOW() ORDER BY radius_ids.id DESC LIMIT 1);
END IF;
 	SET @a = 0;

 	a_loop:
 	WHILE @a < 30 DO
 		IF FOUND_ROWS() = 0 THEN
 			LEAVE a_loop;
END IF;
 		IF @a = 0 THEN
 			IF radius = 0 THEN
 				CREATE TEMPORARY TABLE IF NOT EXISTS tmp_graph AS (
 					SELECT DATE_FORMAT(time,'%Y.%m.%d') AS `date`, COUNT(id) AS `count` FROM base
 					WHERE `time` BETWEEN
 					CONCAT(SUBSTRING_INDEX(@tme, ' ', 1), ' 00:00:00') AND
 					CONCAT(SUBSTRING_INDEX(@tme, ' ', 1), ' 23:59:59')
 				);
ELSE
 				CREATE TEMPORARY TABLE IF NOT EXISTS tmp_graph AS (
 					SELECT DATE_FORMAT(time,'%Y.%m.%d') AS `date`, COUNT(id) AS `count` FROM base
 					JOIN radius_ids USING(id)
 					WHERE `time` BETWEEN
 					CONCAT(SUBSTRING_INDEX(@tme, ' ', 1), ' 00:00:00') AND
 					CONCAT(SUBSTRING_INDEX(@tme, ' ', 1), ' 23:59:59')
 				);
END IF;
ELSE
 			IF radius = 0 THEN
 				INSERT INTO tmp_graph
SELECT DATE_FORMAT(time,'%Y.%m.%d') AS `date`, COUNT(id) AS `count` FROM base
WHERE `time` BETWEEN
          CONCAT(SUBSTRING_INDEX(@tme, ' ', 1), ' 00:00:00') AND
          CONCAT(SUBSTRING_INDEX(@tme, ' ', 1), ' 23:59:59');
ELSE
 				INSERT INTO tmp_graph
SELECT DATE_FORMAT(time,'%Y.%m.%d') AS `date`, COUNT(id) AS `count` FROM base
                                                                             JOIN radius_ids USING(id)
WHERE `time` BETWEEN
          CONCAT(SUBSTRING_INDEX(@tme, ' ', 1), ' 00:00:00') AND
          CONCAT(SUBSTRING_INDEX(@tme, ' ', 1), ' 23:59:59');
END IF;
END IF;
 		SET @a = @a + 1;
 		IF radius = 0 THEN
 			SET @tme = (SELECT `time` FROM base WHERE `time` < CONCAT(SUBSTRING_INDEX(@tme, ' ', 1), ' 00:00:00') ORDER BY `time` DESC LIMIT 1);
ELSE
 			SET @tme = (SELECT `time` FROM base JOIN radius_ids USING(id) WHERE `time` < CONCAT(SUBSTRING_INDEX(@tme, ' ', 1), ' 00:00:00') ORDER BY radius_ids.id DESC LIMIT 1);
END IF;
END WHILE a_loop;

SELECT * FROM tmp_graph;
DROP TABLE IF EXISTS tmp_graph;
END
