# 더 이상 업그레이드 불가능 == ITEM_TREE에서 PARENT_ITEM_ID에 없는 ITEM_ID
SELECT
    ii.ITEM_ID, ITEM_NAME, RARITY
FROM ITEM_INFO ii
WHERE ii.ITEM_ID NOT IN (
                        SELECT
                            DISTINCT PARENT_ITEM_ID AS ITEM_ID
                        FROM ITEM_TREE 
                        WHERE PARENT_ITEM_ID IS NOT NULL)
ORDER BY ii.ITEM_ID DESC