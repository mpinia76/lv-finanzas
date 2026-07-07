-- =====================================================================
--  lv-finanzas | Soporte de moneda por cuenta + cuentas en USD
--  Ejecutar UNA sola vez sobre la base `lv_finanzas`.
--  Recomendado: hacer un backup antes  ->  mysqldump lv_finanzas > backup.sql
-- =====================================================================

-- 1) Nueva columna de moneda por cuenta.
--    Default 'ARS': hoy toda la app se maneja en pesos.
ALTER TABLE `account`
  ADD COLUMN `currency` VARCHAR(5) NOT NULL DEFAULT 'ARS' AFTER `type`;

-- 1b) Las cuentas que ya existen hoy se manejan en pesos.
UPDATE `account` SET `currency` = 'ARS';

-- 2) Cotización del dólar a pesos (editable).
--    >>> ACTUALIZAR este valor con la cotización actual (ARS por 1 USD). <<<
INSERT INTO `settings` (`name`, `value`) VALUES ('cotizacion_usd', '1000');

-- 3) Cuentas nuevas en dólares.
--    'number' es solo un identificador/alias interno (podés cambiarlo).
INSERT INTO `account` (`name`, `number`, `type`, `currency`) VALUES
  ('Belo',              'USD-BELO',  'ahorro',    'USD'),
  ('Payoneer',          'USD-PYN',   'corriente', 'USD'),
  ('Mercado Pago USD',  'USD-MP',    'corriente', 'USD'),
  ('BNA (Banco Nación)','USD-BNA',   'ahorro',    'USD'),
  ('Cocos (Inversión)', 'USD-COCOS', 'ahorro',    'USD');

-- =====================================================================
--  Nota sobre Cocos:
--  Se registra como una cuenta con SALDO ÚNICO en USD. Para reflejar el
--  valor actual de la inversión, cargá un movimiento de ajuste
--  (Entrada/Retiro) cuando cambie, o registrá aportes/rescates.
-- =====================================================================
