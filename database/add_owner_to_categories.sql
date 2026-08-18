-- Separación de categorías por dueño: agrega la columna `owner`.
-- Ejecutar UNA sola vez en la base de datos lv_finanzas.
-- Todas las categorías existentes quedan como 'yo' (Mías) por defecto.
-- Valores válidos: 'yo' (Mías) / 'mama' (De mamá).

ALTER TABLE `categories`
  ADD COLUMN `owner` VARCHAR(20) NOT NULL DEFAULT 'yo' AFTER `type`;

-- Ejemplo para pasar categorías a mamá (ajustar los ids):
-- UPDATE `categories` SET `owner` = 'mama' WHERE `id` IN (52, 53, 54);
