SELECT N,
IF(P IS NULL,'Root',
IF((SELECT COUNT(*) FROM BST WHERE P=B.N) > 0, 'Inner', 'Leaf'))
FROM BST AS B ORDER BY N


SELECT N,
IF(P IS NULL, 'Root',
IF(B.N IN (SELECT P FROM BST), 'Inner', 'Leaf'))
FROM BST AS B ORDER BY N
/* if current node N is parent for at least one node,
and if so then it is 'Inner', if not so, then it is 'Leaf'.*/
