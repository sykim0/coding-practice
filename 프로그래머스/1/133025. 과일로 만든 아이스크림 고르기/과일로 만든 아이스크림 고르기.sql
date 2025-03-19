-- 코드를 입력하세요
SELECT fh.flavor
FROM first_half fh
left join icecream_info ic
on fh.flavor = ic.flavor
WHERE ic.ingredient_type = 'fruit_based' AND fh.total_order > 3000
ORDER BY fh.total_order DESC
#####