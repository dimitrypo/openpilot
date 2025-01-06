from cereal import car
from openpilot.selfdrive.car.interfaces import RadarInterfaceBase

class RadarInterface(RadarInterfaceBase):
  def update(self, can_strings):
    ret = car.RadarData.new_message()
    ret.errors = []  # No errors since radar is intentionally unavailable
    return ret
