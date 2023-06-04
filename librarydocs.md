# Doggos Hub / Library

#### Booting Library

!! I recommend using another Library since this does not look too good !!

Example Librarys:
  **[Orion](https://github.com/shlexware/Orion/blob/main/Documentation.md)**
  **[Kavo](https://xheptcofficial.gitbook.io/kavo-library/)**

```lua
local DoggosLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/meandmystupidity/robloxgamefunctions/main/doggoslib.lua'))()
```

#### Adding Tabs

What do i need to replace?

*Window will already be created.*

- newTab: name it as you like
- Name: Tab Name which will be shown in the GUI

```lua
  local newTab = DoggosLib:AddTab('Name')
```

#### Adding Elements

To add an Element, you need a Tab; see above.

#### Buttons

```lua
  newTab:AddButton({
    Name = 'Test',
    Text = 'Print Hello',
    Callback = function()
      print('Hello')
    end
  })
```

#### Sections

```lua
    newTab:AddSection({
    Name = 'TestSection'
  })
```

#### Toggles

```lua
  local onoff = false
  local newToggle = newTab:AddToggle({
    Text = 'Test Toggle',
    Callback = function(state)
      onoff = state
      print(state, onoff)
    end
  })
```

**WARNING**

To add loops, please make a second variable like above:

```lua
  local onoff = false
  local newToggle = newTab:AddToggle({
    Text = 'Test Toggle',
    Callback = function(state)
      onoff = state
      while onoff do
        task.wait()
        print('Hello')
      end
    end
  })
```

#### Dropdowns

```lua
  local newDropdown = newTab:AddDropdown({
    Options = {'I', 'HAVE'},
    Text = 'Test Dropdown',
    Callback = function(option)

      print(option)

    end

  })
```

#### Refreshing Dropdowns

``` lua
  local newList = {'YOUR', 'ADDRESS'}
  newDropdown:Refresh(newList)
```

#### Adding Keybinds

  ```lua
    local newKeybind = newTab:AddBind({
      Text = 'Test',
      Keybind = Enum.KeyCode.E,
      Callback = function()
        print('Hello')
      end
    })
  ```
  
#### Refreshing Keybinds

  ```lua
    newKeybind:Set(Enum.KeyCode.E)
  ```
  
#### Adding Sliders

  ```lua
    local WalkSpeedSlider = newTab:AddSlider({
      Increment = 1,
      Text = 'Set WalkSpeed',
      ValueName = 'WalkSpeed',
      Min = 1,
      Max = 10,
      Callback = function(value)
        print(value)
      end
    })
  ```
  
#### Refreshing Slider

  ```lua
    WalkSpeedSlider:Set(10)
  ```
  
#### Adding TextBox

  ```lua
    local newTextBox = newTab:AddTextBox({
      Text = 'Super American Holiday Fun',
      DeleteText = false,
      HolderText = 'No',
      Callback = function(value)
        print(value)
      end
    })
  ```
  
#### Refresh TextBox Text

  ```lua
    newTextBox:Set('New Text')
  ```
  
#### Adding Clock

  ```lua
    local newClock = local clock = tab2:AddClock({
      Callback = function() end
    })
  ```
  
#### Stopping Clock

  ```lua
    newClock:Set(false)
  ```
  
#### More Information

**Refreshing Text**

  You are able to Refresh ANY Text with this:
  
  ```lua
    newButton/TextBox/Section/Button/Slider/Dropdown/Toggle/Keybind:NewText('New Text')
  ```
  
  TextBox:NewText('New Text') will not change the TextBox Text but instead the Information Label.
  Use TextBox:Set('New Text') to change the TextBox Text.
  
**Other**
  More Stuff will come out tomorrow.
