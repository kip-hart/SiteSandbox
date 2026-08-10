def time_to_deplete(charge_pct, drain_rate_pct=5.0):
    """Hours until charge_pct reaches zero, at a constant drain rate."""
    return charge_pct / drain_rate_pct

print(time_to_deplete(80))                        # uses the default rate
print(time_to_deplete(80, drain_rate_pct=8.0))     # override by keyword
print(time_to_deplete(80, 2.5))                    # override by position
