function trash()
  os.rename(mp.get_property('path'), '/mnt/.trash/' .. mp.get_property('filename'))
  mp.command('playlist-remove current')
end
mp.register_script_message('trash', trash)

function save()
  os.rename(mp.get_property('path'), '/mnt/.save/' .. mp.get_property('filename'))
  mp.command('playlist-remove current')
end
mp.register_script_message('save', save)
