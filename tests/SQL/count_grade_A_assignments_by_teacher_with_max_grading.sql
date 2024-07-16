-- Write query to find the number of grade A's given by the teacher who has graded the most assignments
WITH teacher_grades AS (
    SELECT
        teacher_id,
        COUNT(*) AS total_assignments
    FROM
        assignments
    GROUP BY
        teacher_id
),
max_grading_teacher AS (
    SELECT
        teacher_id
    FROM
        teacher_grades
    ORDER BY
        total_assignments DESC
    LIMIT 1
)
SELECT
    COUNT(*) AS grade_a_count
FROM
    assignments
WHERE
    teacher_id = (SELECT teacher_id FROM max_grading_teacher)
    AND grade = 'A';
