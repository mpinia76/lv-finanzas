-- Baja lógica de cuentas: agrega la columna `active`.
-- Ejecutar UNA sola vez en la base de datos lv_finanzas.
-- Todas las cuentas existentes quedan activas (active = 1) por defecto.

ALTER TABLE `account`
  ADD COLUMN `active` TINYINT(1) NOT NULL DEFAULT 1 AFTER `type`;
