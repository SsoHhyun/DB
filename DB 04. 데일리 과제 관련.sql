SELECT upper('abcddef')
from dual;

use ssafy_movie;

select concat('내 최애 영화는 ', title)
from movie;

-- 시네마 이름으로 그룹핑하여 각 시네마마다 몇 개의 영화가 상영중인지 조회
SELECT cinema.cinemaname, count(movie.id) as "상영 중"
FROM movie
RIGHT OUTER JOIN cinema
ON movie.cinemacode = cinema.cinemacode
GROUP BY cinema.cinemaname;