-- 코드를 입력하세요
SELECT ugb.title, ugb.board_id, ugr.reply_id, ugr.writer_id, ugr.contents, TO_CHAR(ugr.created_date,'YYYY-MM-DD') AS CREATED_DATE
FROM used_goods_board ugb 
JOIN used_goods_reply ugr ON ugb.board_id = ugr.board_id 
WHERE TO_CHAR(ugb.created_date, 'YYYY-MM') = '2022-10'
ORDER BY ugr.created_date, ugb.title;