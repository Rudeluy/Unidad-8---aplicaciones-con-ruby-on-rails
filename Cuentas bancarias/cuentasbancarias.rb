
class Usuario
  attr_reader :nombre, :cuentas, :CuentaBancaria
  def initialize(nombre, cuentas)
    @nombre = nombre 
    if cuentas.count < 1
      raise ArgumentError.new("debe agregar a lo menos 1 numero de cuenta")
    else
      @cuentas = cuentas
    end
  end

  def saldo_total()
    cantidad_cuentas= cuentas.count
    puts cantidad_cuentas
    saldo_completo = 0
    puts self.cuentas
    
  end
end

class CuentaBancaria
  attr_reader :banco, :numero_de_cuenta, :Usuario
  attr_writer :saldo
  def initialize(banco, numero_de_cuenta, saldo = 0)
    @banco = banco
    @numero_de_cuenta = numero_de_cuenta
    @saldo = saldo   
  end

  def transferir(monto, cuenta)
    self.saldo = self.saldo - monto
    cuenta.saldo = cuenta.saldo + monto
  end
end

cuenta1=CuentaBancaria.new('banco1',12345678,5000)
cuenta2=CuentaBancaria.new('banco1',12345679,5000)

#cuenta2.transferir(4500,'cuenta1')

usuario1 = Usuario.new('antonio', [cuenta1,cuenta2])

