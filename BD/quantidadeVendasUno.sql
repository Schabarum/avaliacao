SELECT C.ID_CLIENTE, C.NOME, C.CPF, M.ID_MODELO, M.DESCRICAO, SUM(I.QUANTIDADE) QUANTIDADE, SUM(I.VL_ITEM) VL_ITEM
  FROM VENDA   V
  JOIN ITEM    I ON V.ID_VENDA   = I.ID_VENDA
  JOIN MODELO  M ON I.ID_MODELO  = M.ID_MODELO
  JOIN CLIENTE C ON V.ID_CLIENTE = C.ID_CLIENTE
 WHERE M.ID_MODELO = 2
 GROUP BY C.ID_CLIENTE, C.NOME, C.CPF, M.ID_MODELO, M.DESCRICAO;