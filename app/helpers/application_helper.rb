module ApplicationHelper

  def past_version?(stats_hash)
    if chk_roma_version(stats_hash['others']['version']) < 65536 #1.0.0
      return true
    else
      return false
    end
  end

  def eosl_expired?(stats_hash)
    if chk_roma_version(stats_hash['others']['version']) < 2062 #0.8.13
      return true
    else
      return false
    end
  end

  def chk_roma_version(vs)
    if /(\d+)\.(\d+)\.(\d+)/ =~ vs
      version = ($1.to_i << 16) + ($2.to_i << 8) + $3.to_i
      return version
    end

    raise
  end

  def memory_mode?(stats_hash)
    if stats_hash['storages[roma]']['storage.option'].size == 0
      return true
    else
      return false
    end
  end

  def storage_type_is_tc?(stats_hash)
    if stats_hash['storages[roma]']['storage.st_class'] == 'TCStorage'
      return true
    else
      return false
    end
  end
 
  def add_00sec(time)
    if time =~ (/^(\d+)-(\d+)-(\d+)T(\d+):(\d+)$/)
      return time << ":00"
    else
      return time
    end
  end
end
