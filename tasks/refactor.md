```
layout="files"
select=".gd"
```

我希望重构现有代码，请根据现有的代码按模块整理出重构计划

重构应该从小到大，每一个重构任务完成都应该可以正常运行项目。

Use the background information provided below to help you accomplish the task.

- Repo Directory Tree
- Selected Files

## Repo Directory Tree

/Users/zhangrui/game/destiny-sacrifice
├── .editorconfig
├── .gitattributes
├── .gitignore
├── .vscode/
│   ├── settings.json
│   └── tasks.json
├── art/
│   ├── MiniRogue Dungeon Premium/
│   │   ├── 1 - Decor/
│   │   │   ├── Decor/
│   │   │   │   ├── 32x32/
│   │   │   │   │   ├── Acid puddle2x.png
│   │   │   │   │   ├── Acid puddle2x.png.import
│   │   │   │   │   ├── Apple2x.png
│   │   │   │   │   ├── Apple2x.png.import
│   │   │   │   │   ├── Blood2x.png
│   │   │   │   │   ├── Blood2x.png.import
│   │   │   │   │   ├── Board Large2x.png
│   │   │   │   │   ├── Board Large2x.png.import
│   │   │   │   │   ├── Board Medium2x.png
│   │   │   │   │   ├── Board Medium2x.png.import
│   │   │   │   │   ├── Board Small2x.png
│   │   │   │   │   ├── Board Small2x.png.import
│   │   │   │   │   ├── Book Green2x.png
│   │   │   │   │   ├── Book Green2x.png.import
│   │   │   │   │   ├── Book Red2x.png
│   │   │   │   │   ├── Book Red2x.png.import
│   │   │   │   │   ├── Book Yellow2x.png
│   │   │   │   │   ├── Book Yellow2x.png.import
│   │   │   │   │   ├── Book shelf 01 2x.png
│   │   │   │   │   ├── Book shelf 01 2x.png.import
│   │   │   │   │   ├── Book shelf 02 2x.png
│   │   │   │   │   ├── Book shelf 02 2x.png.import
│   │   │   │   │   ├── Botton 01 2x.png
│   │   │   │   │   ├── Botton 01 2x.png.import
│   │   │   │   │   ├── Botton 02 2x.png
│   │   │   │   │   ├── Botton 02 2x.png.import
│   │   │   │   │   ├── Botton 03 2x.png
│   │   │   │   │   ├── Botton 03 2x.png.import
│   │   │   │   │   ├── Botton 04 2x.png
│   │   │   │   │   ├── Botton 04 2x.png.import
│   │   │   │   │   ├── Chair01 2x.png
│   │   │   │   │   ├── Chair01 2x.png.import
│   │   │   │   │   ├── Chair02 2x.png
│   │   │   │   │   ├── Chair02 2x.png.import
│   │   │   │   │   ├── Chest2x.png
│   │   │   │   │   ├── Chest2x.png.import
│   │   │   │   │   ├── Coffin2x.png
│   │   │   │   │   ├── Coffin2x.png.import
│   │   │   │   │   ├── Crate 01 2x.png
│   │   │   │   │   ├── Crate 01 2x.png.import
│   │   │   │   │   ├── Crate 02 2x.png
│   │   │   │   │   ├── Crate 02 2x.png.import
│   │   │   │   │   ├── Door Closed2x.png
│   │   │   │   │   ├── Door Closed2x.png.import
│   │   │   │   │   ├── Door Rock2x.png
│   │   │   │   │   ├── Door Rock2x.png.import
│   │   │   │   │   ├── Doors Open2x.png
│   │   │   │   │   ├── Doors Open2x.png.import
│   │   │   │   │   ├── Flag Blue Big2x.png
│   │   │   │   │   ├── Flag Blue Big2x.png.import
│   │   │   │   │   ├── Flag Blue2x.png
│   │   │   │   │   ├── Flag Blue2x.png.import
│   │   │   │   │   ├── Flag Green Big2x.png
│   │   │   │   │   ├── Flag Green Big2x.png.import
│   │   │   │   │   ├── Flag Green2x.png
│   │   │   │   │   ├── Flag Green2x.png.import
│   │   │   │   │   ├── Flag Red Big2x.png
│   │   │   │   │   ├── Flag Red Big2x.png.import
│   │   │   │   │   ├── Flag Red2x.png
│   │   │   │   │   ├── Flag Red2x.png.import
│   │   │   │   │   ├── Flag Yellow Big2x.png
│   │   │   │   │   ├── Flag Yellow Big2x.png.import
│   │   │   │   │   ├── Flag Yellow2x.png
│   │   │   │   │   ├── Flag Yellow2x.png.import
│   │   │   │   │   ├── Gold Rock2x.png
│   │   │   │   │   ├── Gold Rock2x.png.import
│   │   │   │   │   ├── Gold01 2x.png
│   │   │   │   │   ├── Gold01 2x.png.import
│   │   │   │   │   ├── Gold02 2x.png
│   │   │   │   │   ├── Gold02 2x.png.import
│   │   │   │   │   ├── Gold03 2x.png
│   │   │   │   │   ├── Gold03 2x.png.import
│   │   │   │   │   ├── Iron Door2x.png
│   │   │   │   │   ├── Iron Door2x.png.import
│   │   │   │   │   ├── Iron Fance Moss2x.png
│   │   │   │   │   ├── Iron Fance Moss2x.png.import
│   │   │   │   │   ├── Iron Fance2x.png
│   │   │   │   │   ├── Iron Fance2x.png.import
│   │   │   │   │   ├── Key2x.png
│   │   │   │   │   ├── Key2x.png.import
│   │   │   │   │   ├── Lamp Big2x.png
│   │   │   │   │   ├── Lamp Big2x.png.import
│   │   │   │   │   ├── Lamp2x.png
│   │   │   │   │   ├── Lamp2x.png.import
│   │   │   │   │   ├── Paiting 1 2x.png
│   │   │   │   │   ├── Paiting 1 2x.png.import
│   │   │   │   │   ├── Paiting 2 2x.png
│   │   │   │   │   ├── Paiting 2 2x.png.import
│   │   │   │   │   ├── Paiting 3 2x.png
│   │   │   │   │   ├── Paiting 3 2x.png.import
│   │   │   │   │   ├── Paiting 4 2x.png
│   │   │   │   │   ├── Paiting 4 2x.png.import
│   │   │   │   │   ├── Paiting Big2x.png
│   │   │   │   │   ├── Paiting Big2x.png.import
│   │   │   │   │   ├── Pile of Books 01 2x.png
│   │   │   │   │   ├── Pile of Books 01 2x.png.import
│   │   │   │   │   ├── Pile of Books 02 2x.png
│   │   │   │   │   ├── Pile of Books 02 2x.png.import
│   │   │   │   │   ├── Potion HP2x.png
│   │   │   │   │   ├── Potion HP2x.png.import
│   │   │   │   │   ├── Potion Mana2x.png
│   │   │   │   │   ├── Potion Mana2x.png.import
│   │   │   │   │   ├── Rock01 2x.png
│   │   │   │   │   ├── Rock01 2x.png.import
│   │   │   │   │   ├── Rock02 2x.png
│   │   │   │   │   ├── Rock02 2x.png.import
│   │   │   │   │   ├── Scroll2x.png
│   │   │   │   │   ├── Scroll2x.png.import
│   │   │   │   │   ├── Shield2x.png
│   │   │   │   │   ├── Shield2x.png.import
│   │   │   │   │   ├── Skulls2x.png
│   │   │   │   │   ├── Skulls2x.png.import
│   │   │   │   │   ├── Sword2x.png
│   │   │   │   │   ├── Sword2x.png.import
│   │   │   │   │   ├── Table Long2x.png
│   │   │   │   │   ├── Table Long2x.png.import
│   │   │   │   │   ├── Table2x.png
│   │   │   │   │   ├── Table2x.png.import
│   │   │   │   │   ├── Throne2x.png
│   │   │   │   │   ├── Throne2x.png.import
│   │   │   │   │   ├── Tombstone 01 2x.png
│   │   │   │   │   ├── Tombstone 01 2x.png.import
│   │   │   │   │   ├── Tombstone 02 2x.png
│   │   │   │   │   ├── Tombstone 02 2x.png.import
│   │   │   │   │   ├── Tombstone Moss2x.png
│   │   │   │   │   ├── Tombstone Moss2x.png.import
│   │   │   │   │   ├── Vase Grey Broken2x.png
│   │   │   │   │   ├── Vase Grey Broken2x.png.import
│   │   │   │   │   ├── Vase Grey2x.png
│   │   │   │   │   ├── Vase Grey2x.png.import
│   │   │   │   │   ├── Vase Yellow Broken2x.png
│   │   │   │   │   ├── Vase Yellow Broken2x.png.import
│   │   │   │   │   ├── Vase Yellow2x.png
│   │   │   │   │   ├── Vase Yellow2x.png.import
│   │   │   │   │   ├── Wall Chain 01 2x.png
│   │   │   │   │   ├── Wall Chain 01 2x.png.import
│   │   │   │   │   ├── Wall Chain 02 2x.png
│   │   │   │   │   └── Wall Chain 02 2x.png.import
│   │   │   │   ├── Acid puddle.aseprite
│   │   │   │   ├── Apple.aseprite
│   │   │   │   ├── Blood.aseprite
│   │   │   │   ├── Board Large.aseprite
│   │   │   │   ├── Board Medium.aseprite
│   │   │   │   ├── Board Small.aseprite
│   │   │   │   ├── Book Green.aseprite
│   │   │   │   ├── Book Red.aseprite
│   │   │   │   ├── Book Yellow.aseprite
│   │   │   │   ├── Book shelf 01.aseprite
│   │   │   │   ├── Book shelf 02.aseprite
│   │   │   │   ├── Botton 01.aseprite
│   │   │   │   ├── Botton 02.aseprite
│   │   │   │   ├── Botton 03.aseprite
│   │   │   │   ├── Botton 04.aseprite
│   │   │   │   ├── Chair01.aseprite
│   │   │   │   ├── Chair02.aseprite
│   │   │   │   ├── Chest.aseprite
│   │   │   │   ├── Coffin.aseprite
│   │   │   │   ├── Crate 01.aseprite
│   │   │   │   ├── Crate 02.aseprite
│   │   │   │   ├── Door Closed.aseprite
│   │   │   │   ├── Door Rock.aseprite
│   │   │   │   ├── Doors Open.aseprite
│   │   │   │   ├── Flag Blue Big.aseprite
│   │   │   │   ├── Flag Blue.aseprite
│   │   │   │   ├── Flag Green Big.aseprite
│   │   │   │   ├── Flag Green.aseprite
│   │   │   │   ├── Flag Red Big.aseprite
│   │   │   │   ├── Flag Red.aseprite
│   │   │   │   ├── Flag Yellow Big.aseprite
│   │   │   │   ├── Flag Yellow.aseprite
│   │   │   │   ├── Gold Rock.aseprite
│   │   │   │   ├── Gold01.aseprite
│   │   │   │   ├── Gold02.aseprite
│   │   │   │   ├── Gold03.aseprite
│   │   │   │   ├── Iron Door.aseprite
│   │   │   │   ├── Iron Fance Moss.aseprite
│   │   │   │   ├── Iron Fance.aseprite
│   │   │   │   ├── Key.aseprite
│   │   │   │   ├── Lamp Big.aseprite
│   │   │   │   ├── Lamp.aseprite
│   │   │   │   ├── Paiting 1.aseprite
│   │   │   │   ├── Paiting 2.aseprite
│   │   │   │   ├── Paiting 3.aseprite
│   │   │   │   ├── Paiting 4.aseprite
│   │   │   │   ├── Paiting Big.aseprite
│   │   │   │   ├── Pile of Books 01.aseprite
│   │   │   │   ├── Pile of Books 02.aseprite
│   │   │   │   ├── Potion HP.aseprite
│   │   │   │   ├── Potion Mana.aseprite
│   │   │   │   ├── Rock01.aseprite
│   │   │   │   ├── Rock02.aseprite
│   │   │   │   ├── Scroll.aseprite
│   │   │   │   ├── Shield.aseprite
│   │   │   │   ├── Skulls.aseprite
│   │   │   │   ├── Sword.aseprite
│   │   │   │   ├── Table Long.aseprite
│   │   │   │   ├── Table.aseprite
│   │   │   │   ├── Throne.aseprite
│   │   │   │   ├── Tombstone 01.aseprite
│   │   │   │   ├── Tombstone 02.aseprite
│   │   │   │   ├── Tombstone Moss.aseprite
│   │   │   │   ├── Vase Grey Broken.aseprite
│   │   │   │   ├── Vase Grey.aseprite
│   │   │   │   ├── Vase Yellow Broken.aseprite
│   │   │   │   ├── Vase Yellow.aseprite
│   │   │   │   ├── Wall Chain 01.aseprite
│   │   │   │   └── Wall Chain 02.aseprite
│   │   │   └── Decor Animated/
│   │   │       ├── 32x32/
│   │   │       │   ├── Chest Closing-Sheet2x.png
│   │   │       │   ├── Chest Closing-Sheet2x.png.import
│   │   │       │   ├── Chest Opening-Sheet2x.png
│   │   │       │   ├── Chest Opening-Sheet2x.png.import
│   │   │       │   ├── Door Closing-Sheet2x.png
│   │   │       │   ├── Door Closing-Sheet2x.png.import
│   │   │       │   ├── Door Opening-Sheet2x.png
│   │   │       │   ├── Door Opening-Sheet2x.png.import
│   │   │       │   ├── Flag Blue-Sheet2x.png
│   │   │       │   ├── Flag Blue-Sheet2x.png.import
│   │   │       │   ├── Flag Green-Sheet2x.png
│   │   │       │   ├── Flag Green-Sheet2x.png.import
│   │   │       │   ├── Flag Red-Sheet2x.png
│   │   │       │   ├── Flag Red-Sheet2x.png.import
│   │   │       │   ├── Flag Yellow-Sheet2x.png
│   │   │       │   ├── Flag Yellow-Sheet2x.png.import
│   │   │       │   ├── Gold 01-Sheet2x.png
│   │   │       │   ├── Gold 01-Sheet2x.png.import
│   │   │       │   ├── Gold 02-Sheet2x.png
│   │   │       │   ├── Gold 02-Sheet2x.png.import
│   │   │       │   ├── Gold 03-Sheet2x.png
│   │   │       │   ├── Gold 03-Sheet2x.png.import
│   │   │       │   ├── Key-Sheet2x.png
│   │   │       │   ├── Key-Sheet2x.png.import
│   │   │       │   ├── Lamp Blue Big-Sheet2x.png
│   │   │       │   ├── Lamp Blue Big-Sheet2x.png.import
│   │   │       │   ├── Lamp Blue-Sheet2x.png
│   │   │       │   ├── Lamp Blue-Sheet2x.png.import
│   │   │       │   ├── Lamp Yellow Big-Sheet2x.png
│   │   │       │   ├── Lamp Yellow Big-Sheet2x.png.import
│   │   │       │   ├── Lamp Yellow-Sheet2x.png
│   │   │       │   ├── Lamp Yellow-Sheet2x.png.import
│   │   │       │   ├── Potion HP-Sheet2x.png
│   │   │       │   ├── Potion HP-Sheet2x.png.import
│   │   │       │   ├── Potion Mana-Sheet2x.png
│   │   │       │   ├── Potion Mana-Sheet2x.png.import
│   │   │       │   ├── Torch Blue-Sheet2x.png
│   │   │       │   ├── Torch Blue-Sheet2x.png.import
│   │   │       │   ├── Torch Yellow-Sheet2x.png
│   │   │       │   └── Torch Yellow-Sheet2x.png.import
│   │   │       ├── Chest Closing.aseprite
│   │   │       ├── Chest Opening.aseprite
│   │   │       ├── Door Closing.aseprite
│   │   │       ├── Door Opening.aseprite
│   │   │       ├── Door.aseprite
│   │   │       ├── Flag Blue.aseprite
│   │   │       ├── Flag Green.aseprite
│   │   │       ├── Flag Red.aseprite
│   │   │       ├── Flag Yellow.aseprite
│   │   │       ├── Gold 01.aseprite
│   │   │       ├── Gold 02.aseprite
│   │   │       ├── Gold 03.aseprite
│   │   │       ├── Key.aseprite
│   │   │       ├── Lamp Blue Big.aseprite
│   │   │       ├── Lamp Blue.aseprite
│   │   │       ├── Lamp Yellow Big.aseprite
│   │   │       ├── Lamp Yellow.aseprite
│   │   │       ├── Potion HP.aseprite
│   │   │       ├── Potion Mana.aseprite
│   │   │       ├── Torch Blue.aseprite
│   │   │       └── Torch Yellow.aseprite
│   │   ├── 2 - Enemies/
│   │   │   ├── Enemy01 Rat/
│   │   │   │   ├── 32x32/
│   │   │   │   │   ├── Enemy01Atk-Sheet2x.png
│   │   │   │   │   ├── Enemy01Atk-Sheet2x.png.import
│   │   │   │   │   ├── Enemy01Dying-Sheet2x.png
│   │   │   │   │   ├── Enemy01Dying-Sheet2x.png.import
│   │   │   │   │   ├── Enemy01idle-Sheet2x.png
│   │   │   │   │   └── Enemy01idle-Sheet2x.png.import
│   │   │   │   └── Enemy01.aseprite
│   │   │   ├── Enemy02 Golem/
│   │   │   │   ├── 16x16/
│   │   │   │   │   ├── Enemy02Atk-Sheet.png
│   │   │   │   │   ├── Enemy02Atk-Sheet.png.import
│   │   │   │   │   ├── Enemy02Dying-Sheet.png
│   │   │   │   │   ├── Enemy02Dying-Sheet.png.import
│   │   │   │   │   ├── Enemy02Idle-Sheet.png
│   │   │   │   │   └── Enemy02Idle-Sheet.png.import
│   │   │   │   ├── 32x32/
│   │   │   │   │   ├── Enemy02Atk2x-Sheet.png
│   │   │   │   │   ├── Enemy02Atk2x-Sheet.png.import
│   │   │   │   │   ├── Enemy02Dying2x-Sheet.png
│   │   │   │   │   ├── Enemy02Dying2x-Sheet.png.import
│   │   │   │   │   ├── Enemy02Idle2x-Sheet.png
│   │   │   │   │   └── Enemy02Idle2x-Sheet.png.import
│   │   │   │   └── Enemy02.aseprite
│   │   │   ├── Enemy03 Beholder/
│   │   │   │   ├── 16x16/
│   │   │   │   │   ├── Enemy03Atk-Sheet.png
│   │   │   │   │   ├── Enemy03Atk-Sheet.png.import
│   │   │   │   │   ├── Enemy03Dying-Sheet.png
│   │   │   │   │   ├── Enemy03Dying-Sheet.png.import
│   │   │   │   │   ├── Enemy03Idle-Sheet.png
│   │   │   │   │   └── Enemy03Idle-Sheet.png.import
│   │   │   │   ├── 32x32/
│   │   │   │   │   ├── Enemy03Atk-Sheet2x.png
│   │   │   │   │   ├── Enemy03Atk-Sheet2x.png.import
│   │   │   │   │   ├── Enemy03Dying-Sheet2x.png
│   │   │   │   │   ├── Enemy03Dying-Sheet2x.png.import
│   │   │   │   │   ├── Enemy03Idle-Sheet2x.png
│   │   │   │   │   └── Enemy03Idle-Sheet2x.png.import
│   │   │   │   └── Enemy03.aseprite
│   │   │   ├── Enemy04 Stinger/
│   │   │   │   ├── 16x16/
│   │   │   │   │   ├── Enemy04Atk-Sheet.png
│   │   │   │   │   ├── Enemy04Atk-Sheet.png.import
│   │   │   │   │   ├── Enemy04Dying-Sheet.png
│   │   │   │   │   ├── Enemy04Dying-Sheet.png.import
│   │   │   │   │   ├── Enemy04idle-Sheet.png
│   │   │   │   │   └── Enemy04idle-Sheet.png.import
│   │   │   │   ├── 32x32/
│   │   │   │   │   ├── Enemy04Atk-Sheet2x.png
│   │   │   │   │   ├── Enemy04Atk-Sheet2x.png.import
│   │   │   │   │   ├── Enemy04Dying-Sheet2x.png
│   │   │   │   │   ├── Enemy04Dying-Sheet2x.png.import
│   │   │   │   │   ├── Enemy04idle-Sheet2x.png
│   │   │   │   │   └── Enemy04idle-Sheet2x.png.import
│   │   │   │   └── Enemy04.aseprite
│   │   │   ├── Enemy05 Skeleton/
│   │   │   │   ├── 16x16/
│   │   │   │   │   ├── Enemy05Atk-Sheet.png
│   │   │   │   │   ├── Enemy05Atk-Sheet.png.import
│   │   │   │   │   ├── Enemy05Dying-Sheet.png
│   │   │   │   │   ├── Enemy05Dying-Sheet.png.import
│   │   │   │   │   ├── Enemy05Idle-Sheet.png
│   │   │   │   │   └── Enemy05Idle-Sheet.png.import
│   │   │   │   ├── 32x32/
│   │   │   │   │   ├── Enemy05Atk-Sheet2x.png
│   │   │   │   │   ├── Enemy05Atk-Sheet2x.png.import
│   │   │   │   │   ├── Enemy05Dying-Sheet2x.png
│   │   │   │   │   ├── Enemy05Dying-Sheet2x.png.import
│   │   │   │   │   ├── Enemy05Idle-Sheet2x.png
│   │   │   │   │   └── Enemy05Idle-Sheet2x.png.import
│   │   │   │   └── Enemy05.aseprite
│   │   │   ├── Enemy06 Slime/
│   │   │   │   ├── 16x16/
│   │   │   │   │   ├── Enemy06Atk-Sheet.png
│   │   │   │   │   ├── Enemy06Atk-Sheet.png.import
│   │   │   │   │   ├── Enemy06Dying-Sheet.png
│   │   │   │   │   ├── Enemy06Dying-Sheet.png.import
│   │   │   │   │   ├── Enemy06Idle-Sheet.png
│   │   │   │   │   └── Enemy06Idle-Sheet.png.import
│   │   │   │   ├── 32x32/
│   │   │   │   │   ├── Enemy06Atk-Sheet2x.png
│   │   │   │   │   ├── Enemy06Atk-Sheet2x.png.import
│   │   │   │   │   ├── Enemy06Dying-Sheet2x.png
│   │   │   │   │   ├── Enemy06Dying-Sheet2x.png.import
│   │   │   │   │   ├── Enemy06Idle-Sheet2x.png
│   │   │   │   │   └── Enemy06Idle-Sheet2x.png.import
│   │   │   │   └── Enemy06.aseprite
│   │   │   ├── Enemy07 Mummy/
│   │   │   │   ├── 16x16/
│   │   │   │   │   ├── Enemy07Atk-Sheet.png
│   │   │   │   │   ├── Enemy07Atk-Sheet.png.import
│   │   │   │   │   ├── Enemy07Dying-Sheet.png
│   │   │   │   │   ├── Enemy07Dying-Sheet.png.import
│   │   │   │   │   ├── Enemy07Idle-Sheet.png
│   │   │   │   │   └── Enemy07Idle-Sheet.png.import
│   │   │   │   ├── 32x32/
│   │   │   │   │   ├── Enemy07Atk-Sheet2x.png
│   │   │   │   │   ├── Enemy07Atk-Sheet2x.png.import
│   │   │   │   │   ├── Enemy07Dying-Sheet2x.png
│   │   │   │   │   ├── Enemy07Dying-Sheet2x.png.import
│   │   │   │   │   ├── Enemy07Idle-Sheet2x.png
│   │   │   │   │   └── Enemy07Idle-Sheet2x.png.import
│   │   │   │   └── Enemy07.aseprite
│   │   │   ├── Enemy08 Kina/
│   │   │   │   ├── 16x16/
│   │   │   │   │   ├── Enemy08Atk-Sheet.png
│   │   │   │   │   ├── Enemy08Atk-Sheet.png.import
│   │   │   │   │   ├── Enemy08Dying-Sheet.png
│   │   │   │   │   ├── Enemy08Dying-Sheet.png.import
│   │   │   │   │   ├── Enemy08Idle-Sheet.png
│   │   │   │   │   └── Enemy08Idle-Sheet.png.import
│   │   │   │   ├── 32x32/
│   │   │   │   │   ├── Enemy08Atk-Sheet2x.png
│   │   │   │   │   ├── Enemy08Atk-Sheet2x.png.import
│   │   │   │   │   ├── Enemy08Dying-Sheet2x.png
│   │   │   │   │   ├── Enemy08Dying-Sheet2x.png.import
│   │   │   │   │   ├── Enemy08Idle-Sheet2x.png
│   │   │   │   │   └── Enemy08Idle-Sheet2x.png.import
│   │   │   │   └── Enemy08.aseprite
│   │   │   ├── Enemy09 Summoner/
│   │   │   │   ├── 16x16/
│   │   │   │   │   ├── Enemy09Dying-Sheet.png
│   │   │   │   │   ├── Enemy09Dying-Sheet.png.import
│   │   │   │   │   ├── Enemy09atk-Sheet.png
│   │   │   │   │   ├── Enemy09atk-Sheet.png.import
│   │   │   │   │   ├── Enemy09idle-Sheet.png
│   │   │   │   │   └── Enemy09idle-Sheet.png.import
│   │   │   │   ├── 32x32/
│   │   │   │   │   ├── Enemy09Dying-Sheet2x.png
│   │   │   │   │   ├── Enemy09Dying-Sheet2x.png.import
│   │   │   │   │   ├── Enemy09atk-Sheet2x.png
│   │   │   │   │   ├── Enemy09atk-Sheet2x.png.import
│   │   │   │   │   ├── Enemy09idle-Sheet2x.png
│   │   │   │   │   └── Enemy09idle-Sheet2x.png.import
│   │   │   │   └── Enemy09.aseprite
│   │   │   └── Enemy10 Dragon/
│   │   │       ├── 16x16/
│   │   │       │   ├── Enemy10Dying-Sheet.png
│   │   │       │   ├── Enemy10Dying-Sheet.png.import
│   │   │       │   ├── Enemy10atk-Sheet.png
│   │   │       │   ├── Enemy10atk-Sheet.png.import
│   │   │       │   ├── Enemy10idle-Sheet.png
│   │   │       │   └── Enemy10idle-Sheet.png.import
│   │   │       ├── 32x32/
│   │   │       │   ├── Enemy10Dying-Sheet2x.png
│   │   │       │   ├── Enemy10Dying-Sheet2x.png.import
│   │   │       │   ├── Enemy10atk-Sheet2x.png
│   │   │       │   ├── Enemy10atk-Sheet2x.png.import
│   │   │       │   ├── Enemy10idle-Sheet2x.png
│   │   │       │   └── Enemy10idle-Sheet2x.png.import
│   │   │       └── Enemy10.aseprite
│   │   ├── 3 - Heroes/
│   │   │   ├── Hero 01 Mage/
│   │   │   │   ├── 16x16/
│   │   │   │   │   ├── Creating Fireball-Sheet.png
│   │   │   │   │   ├── Creating Fireball-Sheet.png.import
│   │   │   │   │   ├── Fireball Magel-Sheet.png
│   │   │   │   │   ├── Fireball Magel-Sheet.png.import
│   │   │   │   │   ├── Hero01 Mage Atk-Sheet.png
│   │   │   │   │   ├── Hero01 Mage Atk-Sheet.png.import
│   │   │   │   │   ├── Hero01 Mage Idle-Sheet.png
│   │   │   │   │   └── Hero01 Mage Idle-Sheet.png.import
│   │   │   │   ├── 32x32/
│   │   │   │   │   ├── Creating Fireball-Sheet2x.png
│   │   │   │   │   ├── Creating Fireball-Sheet2x.png.import
│   │   │   │   │   ├── Fireball Magel-Sheet2x.png
│   │   │   │   │   ├── Fireball Magel-Sheet2x.png.import
│   │   │   │   │   ├── Hero01 Mage Atk2x-Sheet.png
│   │   │   │   │   ├── Hero01 Mage Atk2x-Sheet.png.import
│   │   │   │   │   ├── Hero01 Mage Idle2x-Sheet.png
│   │   │   │   │   └── Hero01 Mage Idle2x-Sheet.png.import
│   │   │   │   ├── Fireball Mage.aseprite
│   │   │   │   └── Hero01.aseprite
│   │   │   ├── Hero 02 Archer/
│   │   │   │   ├── 16x16/
│   │   │   │   │   ├── Arrow Archer-Sheet.png
│   │   │   │   │   ├── Arrow Archer-Sheet.png.import
│   │   │   │   │   ├── Hero02 Archer Atk-Sheet.png
│   │   │   │   │   ├── Hero02 Archer Atk-Sheet.png.import
│   │   │   │   │   ├── Hero02 Archer Idle-Sheet.png
│   │   │   │   │   └── Hero02 Archer Idle-Sheet.png.import
│   │   │   │   ├── 32x32/
│   │   │   │   │   ├── Arrow Archer-Sheet2x.png
│   │   │   │   │   ├── Arrow Archer-Sheet2x.png.import
│   │   │   │   │   ├── Hero02 Archer Atk-Sheet2x.png
│   │   │   │   │   ├── Hero02 Archer Atk-Sheet2x.png.import
│   │   │   │   │   ├── Hero02 Archer Idle-Sheet2x.png
│   │   │   │   │   └── Hero02 Archer Idle-Sheet2x.png.import
│   │   │   │   ├── Arrow Archer.aseprite
│   │   │   │   └── Hero02.aseprite
│   │   │   ├── Hero 03 Knight/
│   │   │   │   ├── 16x16/
│   │   │   │   │   ├── Hero03 Knight Atk-Sheet.png
│   │   │   │   │   ├── Hero03 Knight Atk-Sheet.png.import
│   │   │   │   │   ├── Hero03 Knight Idle-Sheet.png
│   │   │   │   │   └── Hero03 Knight Idle-Sheet.png.import
│   │   │   │   ├── 32x32/
│   │   │   │   │   ├── Hero03 Knight Atk-Sheet2x.png
│   │   │   │   │   ├── Hero03 Knight Atk-Sheet2x.png.import
│   │   │   │   │   ├── Hero03 Knight Idle-Sheet2x.png
│   │   │   │   │   └── Hero03 Knight Idle-Sheet2x.png.import
│   │   │   │   └── Hero03.aseprite
│   │   │   ├── Hero 04 Rogue/
│   │   │   │   ├── 16x16/
│   │   │   │   │   ├── Hero04 Rogue Atk-Sheet.png
│   │   │   │   │   ├── Hero04 Rogue Atk-Sheet.png.import
│   │   │   │   │   ├── Hero04 Rogue Idle-Sheet.png
│   │   │   │   │   └── Hero04 Rogue Idle-Sheet.png.import
│   │   │   │   ├── 32x32/
│   │   │   │   │   ├── Hero04 Rogue Atk-Sheet2x.png
│   │   │   │   │   ├── Hero04 Rogue Atk-Sheet2x.png.import
│   │   │   │   │   ├── Hero04 Rogue Idle2x-Sheet.png
│   │   │   │   │   └── Hero04 Rogue Idle2x-Sheet.png.import
│   │   │   │   └── Hero04.aseprite
│   │   │   ├── Hero 05 Priest/
│   │   │   │   └── Hero05.aseprite
│   │   │   ├── Hero 06 Druid/
│   │   │   │   └── Hero06.aseprite
│   │   │   ├── Hero 07 Paladin/
│   │   │   │   └── Hero07.aseprite
│   │   │   └── Hero 08 Monk/
│   │   │       └── Hero08.aseprite
│   │   ├── 4 - Tiles/
│   │   │   ├── Tiles/
│   │   │   │   ├── 16x16/
│   │   │   │   │   ├── Acid.png
│   │   │   │   │   ├── Acid.png.import
│   │   │   │   │   ├── Carpets.png
│   │   │   │   │   ├── Carpets.png.import
│   │   │   │   │   ├── Cation Zone Red.png
│   │   │   │   │   ├── Cation Zone Red.png.import
│   │   │   │   │   ├── Hatchway.png
│   │   │   │   │   ├── Hatchway.png.import
│   │   │   │   │   ├── Pillars.png
│   │   │   │   │   ├── Pillars.png.import
│   │   │   │   │   ├── Stairs.png
│   │   │   │   │   ├── Stairs.png.import
│   │   │   │   │   ├── Tile Dungeon.png
│   │   │   │   │   ├── Tile Dungeon.png.import
│   │   │   │   │   ├── Wood bridge.png
│   │   │   │   │   └── Wood bridge.png.import
│   │   │   │   ├── 32x32/
│   │   │   │   │   ├── Acid2x.png
│   │   │   │   │   ├── Acid2x.png.import
│   │   │   │   │   ├── Carpets2x.png
│   │   │   │   │   ├── Carpets2x.png.import
│   │   │   │   │   ├── Cation Zone Red2x.png
│   │   │   │   │   ├── Cation Zone Red2x.png.import
│   │   │   │   │   ├── Hatchway2x.png
│   │   │   │   │   ├── Hatchway2x.png.import
│   │   │   │   │   ├── Pillars2x.png
│   │   │   │   │   ├── Pillars2x.png.import
│   │   │   │   │   ├── Stairs2x.png
│   │   │   │   │   ├── Stairs2x.png.import
│   │   │   │   │   ├── Tile Dungeon2x.png
│   │   │   │   │   ├── Tile Dungeon2x.png.import
│   │   │   │   │   ├── Wood bridge2x.png
│   │   │   │   │   └── Wood bridge2x.png.import
│   │   │   │   ├── Acid.aseprite
│   │   │   │   ├── Carpets.aseprite
│   │   │   │   ├── Cation Zone Red.aseprite
│   │   │   │   ├── Hatchway.aseprite
│   │   │   │   ├── Pillars.aseprite
│   │   │   │   ├── Stairs.aseprite
│   │   │   │   ├── Tile Dungeon.aseprite
│   │   │   │   └── Wood bridge.aseprite
│   │   │   └── Tiles Animated/
│   │   │       ├── 16x16/
│   │   │       │   ├── Acid Bubbles-Sheet.png
│   │   │       │   ├── Acid Bubbles-Sheet.png.import
│   │   │       │   ├── Prisioner-Sheet.png
│   │   │       │   ├── Prisioner-Sheet.png.import
│   │   │       │   ├── Spike Blood-Sheet.png
│   │   │       │   ├── Spike Blood-Sheet.png.import
│   │   │       │   ├── Spike-Sheet.png
│   │   │       │   └── Spike-Sheet.png.import
│   │   │       ├── 32x32/
│   │   │       │   ├── Acid Bubbles2x-Sheet.png
│   │   │       │   ├── Acid Bubbles2x-Sheet.png.import
│   │   │       │   ├── Prisioner2x-Sheet.png
│   │   │       │   ├── Prisioner2x-Sheet.png.import
│   │   │       │   ├── Spike Blood2x-Sheet.png
│   │   │       │   ├── Spike Blood2x-Sheet.png.import
│   │   │       │   ├── Spike2x-Sheet.png
│   │   │       │   └── Spike2x-Sheet.png.import
│   │   │       ├── Acid Bubbles.aseprite
│   │   │       ├── Prisioner.aseprite
│   │   │       ├── Spike Blood.aseprite
│   │   │       └── Spike.aseprite
│   │   └── 5 - Icons/
│   │       ├── 16x16/
│   │       │   ├── Icon.png
│   │       │   └── Icon.png.import
│   │       └── 32x32/
│   │           ├── Icon2x.png
│   │           └── Icon2x.png.import
│   ├── skill_icon/
│   │   ├── arcane_charge.png
│   │   ├── arcane_charge.png.import
│   │   ├── arcane_echo.png
│   │   ├── arcane_echo.png.import
│   │   ├── archer/
│   │   │   ├── Ability_icons1_02.png
│   │   │   ├── Ability_icons1_02.png.import
│   │   │   ├── Ability_icons1_03.png
│   │   │   ├── Ability_icons1_03.png.import
│   │   │   ├── Ability_icons1_04.png
│   │   │   ├── Ability_icons1_04.png.import
│   │   │   ├── Ability_icons1_05.png
│   │   │   ├── Ability_icons1_05.png.import
│   │   │   ├── Ability_icons1_06.png
│   │   │   ├── Ability_icons1_06.png.import
│   │   │   ├── Ability_icons1_07.png
│   │   │   ├── Ability_icons1_07.png.import
│   │   │   ├── Ability_icons1_08.png
│   │   │   ├── Ability_icons1_08.png.import
│   │   │   ├── Ability_icons1_09.png
│   │   │   ├── Ability_icons1_09.png.import
│   │   │   ├── Ability_icons1_10.png
│   │   │   ├── Ability_icons1_10.png.import
│   │   │   ├── Ability_icons1_11.png
│   │   │   ├── Ability_icons1_11.png.import
│   │   │   ├── Ability_icons1_12.png
│   │   │   ├── Ability_icons1_12.png.import
│   │   │   ├── Ability_icons1_13.png
│   │   │   ├── Ability_icons1_13.png.import
│   │   │   ├── Ability_icons1_14.png
│   │   │   ├── Ability_icons1_14.png.import
│   │   │   ├── Ability_icons1_15.png
│   │   │   ├── Ability_icons1_15.png.import
│   │   │   ├── Ability_icons1_16.png
│   │   │   ├── Ability_icons1_16.png.import
│   │   │   ├── Ability_icons1_17.png
│   │   │   ├── Ability_icons1_17.png.import
│   │   │   ├── Ability_icons1_18.png
│   │   │   ├── Ability_icons1_18.png.import
│   │   │   ├── Ability_icons1_19.png
│   │   │   ├── Ability_icons1_19.png.import
│   │   │   ├── Ability_icons1_20.png
│   │   │   ├── Ability_icons1_20.png.import
│   │   │   ├── Ability_icons1_21.png
│   │   │   ├── Ability_icons1_21.png.import
│   │   │   ├── Ability_icons1_22.png
│   │   │   ├── Ability_icons1_22.png.import
│   │   │   ├── Ability_icons1_23.png
│   │   │   ├── Ability_icons1_23.png.import
│   │   │   ├── Ability_icons1_24.png
│   │   │   ├── Ability_icons1_24.png.import
│   │   │   ├── Ability_icons1_25.png
│   │   │   ├── Ability_icons1_25.png.import
│   │   │   ├── Ability_icons1_26.png
│   │   │   ├── Ability_icons1_26.png.import
│   │   │   ├── Ability_icons1_27.png
│   │   │   ├── Ability_icons1_27.png.import
│   │   │   ├── Ability_icons1_28.png
│   │   │   ├── Ability_icons1_28.png.import
│   │   │   ├── Ability_icons1_29.png
│   │   │   ├── Ability_icons1_29.png.import
│   │   │   ├── Ability_icons1_30.png
│   │   │   ├── Ability_icons1_30.png.import
│   │   │   ├── Ability_icons1_31.png
│   │   │   ├── Ability_icons1_31.png.import
│   │   │   ├── Ability_icons1_32.png
│   │   │   ├── Ability_icons1_32.png.import
│   │   │   ├── Ability_icons1_33.png
│   │   │   ├── Ability_icons1_33.png.import
│   │   │   ├── Ability_icons1_34.png
│   │   │   ├── Ability_icons1_34.png.import
│   │   │   ├── Ability_icons1_35.png
│   │   │   ├── Ability_icons1_35.png.import
│   │   │   ├── Ability_icons1_36.png
│   │   │   ├── Ability_icons1_36.png.import
│   │   │   ├── Ability_icons1_37.png
│   │   │   ├── Ability_icons1_37.png.import
│   │   │   ├── Ability_icons1_38.png
│   │   │   ├── Ability_icons1_38.png.import
│   │   │   ├── Ability_icons1_39.png
│   │   │   ├── Ability_icons1_39.png.import
│   │   │   ├── Ability_icons1_40.png
│   │   │   ├── Ability_icons1_40.png.import
│   │   │   ├── Ability_icons1_41.png
│   │   │   ├── Ability_icons1_41.png.import
│   │   │   ├── Ability_icons1_42.png
│   │   │   ├── Ability_icons1_42.png.import
│   │   │   ├── Ability_icons1_43.png
│   │   │   ├── Ability_icons1_43.png.import
│   │   │   ├── Ability_icons1_44.png
│   │   │   ├── Ability_icons1_44.png.import
│   │   │   ├── Ability_icons1_45.png
│   │   │   ├── Ability_icons1_45.png.import
│   │   │   ├── Ability_icons1_46.png
│   │   │   ├── Ability_icons1_46.png.import
│   │   │   ├── Ability_icons1_47.png
│   │   │   ├── Ability_icons1_47.png.import
│   │   │   ├── Ability_icons1_48.png
│   │   │   ├── Ability_icons1_48.png.import
│   │   │   ├── Ability_icons1_49.png
│   │   │   ├── Ability_icons1_49.png.import
│   │   │   ├── Ability_icons1_50.png
│   │   │   └── Ability_icons1_50.png.import
│   │   ├── arrow_shower.png
│   │   ├── arrow_shower.png.import
│   │   ├── chain_fireball.png
│   │   ├── chain_fireball.png.import
│   │   ├── cleaving_strike.png
│   │   ├── cleaving_strike.png.import
│   │   ├── conquest_rhythm.png
│   │   ├── conquest_rhythm.png.import
│   │   ├── fireball.png
│   │   ├── fireball.png.import
│   │   ├── flame_armor.png
│   │   ├── flame_armor.png.import
│   │   ├── hold_the_line.png
│   │   ├── hold_the_line.png.import
│   │   ├── invigorating_anger.png
│   │   ├── invigorating_anger.png.import
│   │   ├── iron_will.png
│   │   ├── iron_will.png.import
│   │   ├── knight/
│   │   │   ├── Ability_icons1_100.png
│   │   │   ├── Ability_icons1_100.png.import
│   │   │   ├── Ability_icons1_51.png
│   │   │   ├── Ability_icons1_51.png.import
│   │   │   ├── Ability_icons1_52.png
│   │   │   ├── Ability_icons1_52.png.import
│   │   │   ├── Ability_icons1_53.png
│   │   │   ├── Ability_icons1_53.png.import
│   │   │   ├── Ability_icons1_54.png
│   │   │   ├── Ability_icons1_54.png.import
│   │   │   ├── Ability_icons1_55.png
│   │   │   ├── Ability_icons1_55.png.import
│   │   │   ├── Ability_icons1_57.png
│   │   │   ├── Ability_icons1_57.png.import
│   │   │   ├── Ability_icons1_58.png
│   │   │   ├── Ability_icons1_58.png.import
│   │   │   ├── Ability_icons1_59.png
│   │   │   ├── Ability_icons1_59.png.import
│   │   │   ├── Ability_icons1_60.png
│   │   │   ├── Ability_icons1_60.png.import
│   │   │   ├── Ability_icons1_61.png
│   │   │   ├── Ability_icons1_61.png.import
│   │   │   ├── Ability_icons1_62.png
│   │   │   ├── Ability_icons1_62.png.import
│   │   │   ├── Ability_icons1_64.png
│   │   │   ├── Ability_icons1_64.png.import
│   │   │   ├── Ability_icons1_65.png
│   │   │   ├── Ability_icons1_65.png.import
│   │   │   ├── Ability_icons1_66.png
│   │   │   ├── Ability_icons1_66.png.import
│   │   │   ├── Ability_icons1_67.png
│   │   │   ├── Ability_icons1_67.png.import
│   │   │   ├── Ability_icons1_68.png
│   │   │   ├── Ability_icons1_68.png.import
│   │   │   ├── Ability_icons1_70.png
│   │   │   ├── Ability_icons1_70.png.import
│   │   │   ├── Ability_icons1_71.png
│   │   │   ├── Ability_icons1_71.png.import
│   │   │   ├── Ability_icons1_72.png
│   │   │   ├── Ability_icons1_72.png.import
│   │   │   ├── Ability_icons1_73.png
│   │   │   ├── Ability_icons1_73.png.import
│   │   │   ├── Ability_icons1_75.png
│   │   │   ├── Ability_icons1_75.png.import
│   │   │   ├── Ability_icons1_76.png
│   │   │   ├── Ability_icons1_76.png.import
│   │   │   ├── Ability_icons1_77.png
│   │   │   ├── Ability_icons1_77.png.import
│   │   │   ├── Ability_icons1_78.png
│   │   │   ├── Ability_icons1_78.png.import
│   │   │   ├── Ability_icons1_79.png
│   │   │   ├── Ability_icons1_79.png.import
│   │   │   ├── Ability_icons1_80.png
│   │   │   ├── Ability_icons1_80.png.import
│   │   │   ├── Ability_icons1_81.png
│   │   │   ├── Ability_icons1_81.png.import
│   │   │   ├── Ability_icons1_82.png
│   │   │   ├── Ability_icons1_82.png.import
│   │   │   ├── Ability_icons1_83.png
│   │   │   ├── Ability_icons1_83.png.import
│   │   │   ├── Ability_icons1_84.png
│   │   │   ├── Ability_icons1_84.png.import
│   │   │   ├── Ability_icons1_86.png
│   │   │   ├── Ability_icons1_86.png.import
│   │   │   ├── Ability_icons1_87.png
│   │   │   ├── Ability_icons1_87.png.import
│   │   │   ├── Ability_icons1_88.png
│   │   │   ├── Ability_icons1_88.png.import
│   │   │   ├── Ability_icons1_89.png
│   │   │   ├── Ability_icons1_89.png.import
│   │   │   ├── Ability_icons1_90.png
│   │   │   ├── Ability_icons1_90.png.import
│   │   │   ├── Ability_icons1_91.png
│   │   │   ├── Ability_icons1_91.png.import
│   │   │   ├── Ability_icons1_92.png
│   │   │   ├── Ability_icons1_92.png.import
│   │   │   ├── Ability_icons1_93.png
│   │   │   ├── Ability_icons1_93.png.import
│   │   │   ├── Ability_icons1_94.png
│   │   │   ├── Ability_icons1_94.png.import
│   │   │   ├── Ability_icons1_95.png
│   │   │   ├── Ability_icons1_95.png.import
│   │   │   ├── Ability_icons1_96.png
│   │   │   ├── Ability_icons1_96.png.import
│   │   │   ├── Ability_icons1_97.png
│   │   │   ├── Ability_icons1_97.png.import
│   │   │   ├── Ability_icons1_98.png
│   │   │   ├── Ability_icons1_98.png.import
│   │   │   ├── Ability_icons1_99.png
│   │   │   └── Ability_icons1_99.png.import
│   │   └── mage/
│   │       ├── Ability_icons2_02.png
│   │       ├── Ability_icons2_02.png.import
│   │       ├── Ability_icons2_03.png
│   │       ├── Ability_icons2_03.png.import
│   │       ├── Ability_icons2_04.png
│   │       ├── Ability_icons2_04.png.import
│   │       ├── Ability_icons2_06.png
│   │       ├── Ability_icons2_06.png.import
│   │       ├── Ability_icons2_07.png
│   │       ├── Ability_icons2_07.png.import
│   │       ├── Ability_icons2_08.png
│   │       ├── Ability_icons2_08.png.import
│   │       ├── Ability_icons2_09.png
│   │       ├── Ability_icons2_09.png.import
│   │       ├── Ability_icons2_10.png
│   │       ├── Ability_icons2_10.png.import
│   │       ├── Ability_icons2_100.png
│   │       ├── Ability_icons2_100.png.import
│   │       ├── Ability_icons2_11.png
│   │       ├── Ability_icons2_11.png.import
│   │       ├── Ability_icons2_12.png
│   │       ├── Ability_icons2_12.png.import
│   │       ├── Ability_icons2_13.png
│   │       ├── Ability_icons2_13.png.import
│   │       ├── Ability_icons2_14.png
│   │       ├── Ability_icons2_14.png.import
│   │       ├── Ability_icons2_15.png
│   │       ├── Ability_icons2_15.png.import
│   │       ├── Ability_icons2_16.png
│   │       ├── Ability_icons2_16.png.import
│   │       ├── Ability_icons2_17.png
│   │       ├── Ability_icons2_17.png.import
│   │       ├── Ability_icons2_18.png
│   │       ├── Ability_icons2_18.png.import
│   │       ├── Ability_icons2_19.png
│   │       ├── Ability_icons2_19.png.import
│   │       ├── Ability_icons2_20.png
│   │       ├── Ability_icons2_20.png.import
│   │       ├── Ability_icons2_21.png
│   │       ├── Ability_icons2_21.png.import
│   │       ├── Ability_icons2_22.png
│   │       ├── Ability_icons2_22.png.import
│   │       ├── Ability_icons2_23.png
│   │       ├── Ability_icons2_23.png.import
│   │       ├── Ability_icons2_24.png
│   │       ├── Ability_icons2_24.png.import
│   │       ├── Ability_icons2_25.png
│   │       ├── Ability_icons2_25.png.import
│   │       ├── Ability_icons2_26.png
│   │       ├── Ability_icons2_26.png.import
│   │       ├── Ability_icons2_27.png
│   │       ├── Ability_icons2_27.png.import
│   │       ├── Ability_icons2_28.png
│   │       ├── Ability_icons2_28.png.import
│   │       ├── Ability_icons2_29.png
│   │       ├── Ability_icons2_29.png.import
│   │       ├── Ability_icons2_30.png
│   │       ├── Ability_icons2_30.png.import
│   │       ├── Ability_icons2_31.png
│   │       ├── Ability_icons2_31.png.import
│   │       ├── Ability_icons2_32.png
│   │       ├── Ability_icons2_32.png.import
│   │       ├── Ability_icons2_33.png
│   │       ├── Ability_icons2_33.png.import
│   │       ├── Ability_icons2_34.png
│   │       ├── Ability_icons2_34.png.import
│   │       ├── Ability_icons2_35.png
│   │       ├── Ability_icons2_35.png.import
│   │       ├── Ability_icons2_36.png
│   │       ├── Ability_icons2_36.png.import
│   │       ├── Ability_icons2_37.png
│   │       ├── Ability_icons2_37.png.import
│   │       ├── Ability_icons2_38.png
│   │       ├── Ability_icons2_38.png.import
│   │       ├── Ability_icons2_39.png
│   │       ├── Ability_icons2_39.png.import
│   │       ├── Ability_icons2_40.png
│   │       ├── Ability_icons2_40.png.import
│   │       ├── Ability_icons2_42.png
│   │       ├── Ability_icons2_42.png.import
│   │       ├── Ability_icons2_43.png
│   │       ├── Ability_icons2_43.png.import
│   │       ├── Ability_icons2_44.png
│   │       ├── Ability_icons2_44.png.import
│   │       ├── Ability_icons2_45.png
│   │       ├── Ability_icons2_45.png.import
│   │       ├── Ability_icons2_46.png
│   │       ├── Ability_icons2_46.png.import
│   │       ├── Ability_icons2_47.png
│   │       ├── Ability_icons2_47.png.import
│   │       ├── Ability_icons2_48.png
│   │       ├── Ability_icons2_48.png.import
│   │       ├── Ability_icons2_49.png
│   │       ├── Ability_icons2_49.png.import
│   │       ├── Ability_icons2_50.png
│   │       ├── Ability_icons2_50.png.import
│   │       ├── Ability_icons2_51.png
│   │       ├── Ability_icons2_51.png.import
│   │       ├── Ability_icons2_52.png
│   │       ├── Ability_icons2_52.png.import
│   │       ├── Ability_icons2_53.png
│   │       ├── Ability_icons2_53.png.import
│   │       ├── Ability_icons2_54.png
│   │       ├── Ability_icons2_54.png.import
│   │       ├── Ability_icons2_55.png
│   │       ├── Ability_icons2_55.png.import
│   │       ├── Ability_icons2_56.png
│   │       ├── Ability_icons2_56.png.import
│   │       ├── Ability_icons2_57.png
│   │       ├── Ability_icons2_57.png.import
│   │       ├── Ability_icons2_58.png
│   │       ├── Ability_icons2_58.png.import
│   │       ├── Ability_icons2_59.png
│   │       ├── Ability_icons2_59.png.import
│   │       ├── Ability_icons2_60.png
│   │       ├── Ability_icons2_60.png.import
│   │       ├── Ability_icons2_62.png
│   │       ├── Ability_icons2_62.png.import
│   │       ├── Ability_icons2_63.png
│   │       ├── Ability_icons2_63.png.import
│   │       ├── Ability_icons2_64.png
│   │       ├── Ability_icons2_64.png.import
│   │       ├── Ability_icons2_65.png
│   │       ├── Ability_icons2_65.png.import
│   │       ├── Ability_icons2_66.png
│   │       ├── Ability_icons2_66.png.import
│   │       ├── Ability_icons2_67.png
│   │       ├── Ability_icons2_67.png.import
│   │       ├── Ability_icons2_68.png
│   │       ├── Ability_icons2_68.png.import
│   │       ├── Ability_icons2_69.png
│   │       ├── Ability_icons2_69.png.import
│   │       ├── Ability_icons2_70.png
│   │       ├── Ability_icons2_70.png.import
│   │       ├── Ability_icons2_71.png
│   │       ├── Ability_icons2_71.png.import
│   │       ├── Ability_icons2_72.png
│   │       ├── Ability_icons2_72.png.import
│   │       ├── Ability_icons2_73.png
│   │       ├── Ability_icons2_73.png.import
│   │       ├── Ability_icons2_74.png
│   │       ├── Ability_icons2_74.png.import
│   │       ├── Ability_icons2_75.png
│   │       ├── Ability_icons2_75.png.import
│   │       ├── Ability_icons2_76.png
│   │       ├── Ability_icons2_76.png.import
│   │       ├── Ability_icons2_77.png
│   │       ├── Ability_icons2_77.png.import
│   │       ├── Ability_icons2_78.png
│   │       ├── Ability_icons2_78.png.import
│   │       ├── Ability_icons2_79.png
│   │       ├── Ability_icons2_79.png.import
│   │       ├── Ability_icons2_80.png
│   │       ├── Ability_icons2_80.png.import
│   │       ├── Ability_icons2_81.png
│   │       ├── Ability_icons2_81.png.import
│   │       ├── Ability_icons2_82.png
│   │       ├── Ability_icons2_82.png.import
│   │       ├── Ability_icons2_83.png
│   │       ├── Ability_icons2_83.png.import
│   │       ├── Ability_icons2_84.png
│   │       ├── Ability_icons2_84.png.import
│   │       ├── Ability_icons2_85.png
│   │       ├── Ability_icons2_85.png.import
│   │       ├── Ability_icons2_86.png
│   │       ├── Ability_icons2_86.png.import
│   │       ├── Ability_icons2_87.png
│   │       ├── Ability_icons2_87.png.import
│   │       ├── Ability_icons2_88.png
│   │       ├── Ability_icons2_88.png.import
│   │       ├── Ability_icons2_89.png
│   │       ├── Ability_icons2_89.png.import
│   │       ├── Ability_icons2_90.png
│   │       ├── Ability_icons2_90.png.import
│   │       ├── Ability_icons2_91.png
│   │       ├── Ability_icons2_91.png.import
│   │       ├── Ability_icons2_92.png
│   │       ├── Ability_icons2_92.png.import
│   │       ├── Ability_icons2_93.png
│   │       ├── Ability_icons2_93.png.import
│   │       ├── Ability_icons2_94.png
│   │       ├── Ability_icons2_94.png.import
│   │       ├── Ability_icons2_95.png
│   │       ├── Ability_icons2_95.png.import
│   │       ├── Ability_icons2_97.png
│   │       ├── Ability_icons2_97.png.import
│   │       ├── Ability_icons2_98.png
│   │       ├── Ability_icons2_98.png.import
│   │       ├── Ability_icons2_99.png
│   │       └── Ability_icons2_99.png.import
│   └── texture/
│       ├── character/
│       │   ├── archer.tres
│       │   ├── knight.tres
│       │   └── mage.tres
│       ├── hero/
│       │   ├── knight.tres
│       │   └── mage.tres
│       ├── icon/
│       │   └── gold.tres
│       └── property/
│           ├── attack.tres
│           └── hp.tres
├── character/
│   ├── character.gd
│   ├── character.gd.uid
│   ├── character_resource.gd
│   ├── character_resource.gd.uid
│   ├── enemy/
│   │   ├── Skeleton/
│   │   │   └── Skeleton.tscn
│   │   ├── enemy.gd
│   │   └── enemy.gd.uid
│   └── hero/
│       ├── archer/
│       │   ├── Archer.tscn
│       │   ├── archer.gd
│       │   ├── archer.gd.uid
│       │   ├── arrow.gd
│       │   ├── arrow.gd.uid
│       │   └── arrow.tscn
│       ├── hero.gd
│       ├── hero.gd.uid
│       ├── knight/
│       │   └── Knight.tscn
│       └── mage/
│           ├── Mage.tscn
│           ├── fire_ball.gd
│           ├── fire_ball.gd.uid
│           ├── fire_ball.tscn
│           ├── mage.gd
│           └── mage.gd.uid
├── doc/
│   ├── 技能构件.md
│   ├── 游戏设计.md
│   └── 神祇.md
├── global/
│   ├── enemy_map.gd
│   ├── enemy_map.gd.uid
│   ├── event_bus.gd
│   ├── event_bus.gd.uid
│   ├── magic_map.gd
│   ├── magic_map.gd.uid
│   ├── resource/
│   │   ├── effect/
│   │   │   ├── effect.gd
│   │   │   └── effect.gd.uid
│   │   ├── enemy/
│   │   │   ├── enemy.attack.translation
│   │   │   ├── enemy.character.translation
│   │   │   ├── enemy.csv
│   │   │   ├── enemy.csv.import
│   │   │   ├── enemy.hp.translation
│   │   │   ├── enemy.loot.translation
│   │   │   ├── enemy.skills.translation
│   │   │   ├── enemy.type.translation
│   │   │   ├── enemy_resource.gd
│   │   │   ├── enemy_resource.gd.uid
│   │   │   └── skeleton.tres
│   │   ├── hero/
│   │   │   ├── archer.tres
│   │   │   ├── hero_resource.gd
│   │   │   ├── hero_resource.gd.uid
│   │   │   ├── knight.tres
│   │   │   └── mage.tres
│   │   ├── magic/
│   │   │   ├── magic.cost.translation
│   │   │   ├── magic.csv
│   │   │   ├── magic.csv.import
│   │   │   ├── magic.description.translation
│   │   │   ├── magic.name.translation
│   │   │   ├── magic.price.translation
│   │   │   ├── magic.target.translation
│   │   │   ├── magic.unlock.translation
│   │   │   ├── magic_card_resource.gd
│   │   │   └── magic_card_resource.gd.uid
│   │   ├── skill/
│   │   │   ├── skill_resource.gd
│   │   │   ├── skill_resource.gd.uid
│   │   │   ├── skills.csv
│   │   │   ├── skills.csv.import
│   │   │   ├── skills.description.translation
│   │   │   ├── skills.name.translation
│   │   │   └── skills.unlock.translation
│   │   ├── team_resource.gd
│   │   └── team_resource.gd.uid
│   ├── resource_manager/
│   │   ├── normal_team.tres
│   │   ├── resource_manager.gd
│   │   └── resource_manager.gd.uid
│   ├── scene_manager/
│   │   ├── scene_manager.gd
│   │   └── scene_manager.gd.uid
│   ├── skill_map.gd
│   └── skill_map.gd.uid
├── icon.svg
├── icon.svg.import
├── project.godot
├── scene/
│   ├── combat_scene/
│   │   ├── combat_manager/
│   │   │   ├── combat_manager.gd
│   │   │   ├── combat_manager.gd.uid
│   │   │   └── combat_manager.tscn
│   │   ├── combat_scene.gd
│   │   ├── combat_scene.gd.uid
│   │   ├── combat_scene.tscn
│   │   └── slot/
│   │       ├── slot.gd
│   │       ├── slot.gd.uid
│   │       ├── slot.tscn
│   │       ├── team.gd
│   │       ├── team.gd.uid
│   │       └── team.tscn
│   ├── magic_card_target_selector/
│   │   ├── arc.gd
│   │   ├── arc.gd.uid
│   │   ├── arc.tscn
│   │   ├── magic_card_target_selector.gd
│   │   ├── magic_card_target_selector.gd.uid
│   │   └── magic_card_target_selector.tscn
│   ├── preparation_scene/
│   │   ├── preparation_scene.gd
│   │   ├── preparation_scene.gd.uid
│   │   └── preparation_scene.tscn
│   └── strategy_scene/
│       ├── hand.gd
│       ├── hand.gd.uid
│       ├── magic_card_grid.gd
│       ├── magic_card_grid.gd.uid
│       ├── strategy_scene.gd
│       ├── strategy_scene.gd.uid
│       └── strategy_scene.tscn
├── scripts/
│   └── fork_task.py
├── tasks/
│   └── refactor.md
├── theme/
│   ├── font/
│   │   ├── zpix.ttf
│   │   └── zpix.ttf.import
│   ├── skill_line.tres
│   └── ui_font.tres
├── tile/
│   └── dungeon.tres
└── ui/
    ├── animated_texture_rect/
    │   ├── AnimationTextureRect.tscn
    │   ├── animation_texture_rect.gd
    │   └── animation_texture_rect.gd.uid
    ├── battle_ui/
    │   └── battle_ui.tscn
    ├── hero_card/
    │   ├── hero_card.gd
    │   ├── hero_card.gd.uid
    │   └── hero_card.tscn
    ├── hero_ui/
    │   ├── hero_ui.gd
    │   ├── hero_ui.gd.uid
    │   └── hero_ui.tscn
    ├── magic_card/
    │   ├── magic_card.gd
    │   ├── magic_card.gd.uid
    │   ├── magic_card.tscn
    │   ├── magic_card_state/
    │   │   ├── magic_card_aiming_state.gd
    │   │   ├── magic_card_aiming_state.gd.uid
    │   │   ├── magic_card_base_state.gd
    │   │   ├── magic_card_base_state.gd.uid
    │   │   ├── magic_card_buying_state.gd
    │   │   ├── magic_card_buying_state.gd.uid
    │   │   ├── magic_card_clicked_state.gd
    │   │   ├── magic_card_clicked_state.gd.uid
    │   │   ├── magic_card_dragging_state.gd
    │   │   ├── magic_card_dragging_state.gd.uid
    │   │   ├── magic_card_on_sale_state.gd
    │   │   ├── magic_card_on_sale_state.gd.uid
    │   │   ├── magic_card_released_state.gd
    │   │   ├── magic_card_released_state.gd.uid
    │   │   ├── magic_card_state.gd
    │   │   └── magic_card_state.gd.uid
    │   ├── magic_card_state_machine.gd
    │   └── magic_card_state_machine.gd.uid
    ├── skill_display/
    │   ├── skill_display.gd
    │   ├── skill_display.gd.uid
    │   └── skill_display.tscn
    └── strategy_ui/
        └── strategy_ui.tscn


## Selected Files


<!-- Read File: character/character.gd -->
extends Node2D
class_name Character

@export var character_resource: CharacterResource : set = set_character_resource

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sprite: Sprite2D = $Sprite2D # Assuming the sprite node is named Sprite2D
@onready var hp_label: Label = $HPLabel
@onready var attack_label: Label = $AttackLabel
@onready var hit_area: Area2D = $HitArea

@export var attack_move_duration: float = 0.2
@export var attack_horizontal_offset: float = 24.0

const IDLE_ANIMATION_NAME: String = "idle"
const ATTACK_ANIMATION_NAME: String = "attack"

var is_attacking: bool = false # Flag to prevent concurrent attacks

static func from_resource(resource: CharacterResource) -> Character:
	var character = load("res://character/"+resource.type+"/"+resource.character_class+"/"+resource.character_class+".tscn").instantiate()
	return character as Character

func set_character_resource(new_resource: CharacterResource):
	# 如果旧资源存在且有效，断开连接
	if character_resource and is_instance_valid(character_resource):
		if character_resource.is_connected("attack_changed",Callable(self,"update_labels")):
			character_resource.disconnect("attack_changed",Callable(self,"update_labels"))
		if character_resource.is_connected("hp_changed",Callable(self,"update_labels")):
			character_resource.disconnect("hp_changed",Callable(self,"update_labels"))

	character_resource = new_resource.duplicate()

	if character_resource and is_instance_valid(character_resource):
		# 连接信号到 update_labels
		# 使用 bind() 可以让 update_labels 知道是哪个信号触发的（虽然这里不需要）
		character_resource.attack_changed.connect(update_labels)
		character_resource.hp_changed.connect(update_labels)

	# 立即更新一次标签
	await ready
	update_labels()
	hit_area.area_entered.connect(hurt)

func update_labels(_value = null):
	print("update_labels")
	if character_resource:
		attack_label.text = str(character_resource.attack)
		hp_label.text = str(character_resource.HP)
	else:
		attack_label.text = "N/A"
		hp_label.text = "N/A"

func play_attack_animation(target: Character):
	var tween_move_to = create_tween()
	var start_position = global_position # Position after pre-attack move (if any)

	# Determine move offset based on attacker type
	var move_offset = Vector2.ZERO
	if character_resource: # Check attacker's resource
		if character_resource.type == "hero":
			# Hero attacks: move to the left of the target
			move_offset = Vector2(-attack_horizontal_offset, 0)
		elif character_resource.type == "enemy":
			# Enemy attacks: move to the right of the target
			move_offset = Vector2(attack_horizontal_offset, 0)

	# Calculate final position
	var final_target_position = target.global_position + move_offset
	tween_move_to.tween_property(self, "global_position", final_target_position, attack_move_duration).set_trans(Tween.TRANS_SINE)
	await tween_move_to.finished # Wait for movement to target to finish

	# Play attack animation
	animation_player.play("attack")
	await animation_player.animation_finished # Wait for animation to finish

	# Move back slightly to the position where attack animation started
	var tween_move_back_slightly = create_tween()
	tween_move_back_slightly.tween_property(self, "global_position", start_position, attack_move_duration).set_trans(Tween.TRANS_SINE)
	await tween_move_back_slightly.finished # Wait for slight movement back to finish

func attack(target: Character):
	if is_attacking: # Prevent starting a new attack while one is running
		return
	EventBus.before_attack.emit(self, target)
	is_attacking = true

	var original_position = global_position # Store the very initial position

	# Add pre-attack movement based on character type
	var pre_attack_move_duration = 0.2
	var pre_attack_pause_duration = 0.2 # Pause duration
	var pre_attack_move_offset = Vector2.ZERO
	if character_resource and character_resource.type == "hero":
		pre_attack_move_offset = Vector2(32, 0)
	elif character_resource and character_resource.type == "enemy":
		pre_attack_move_offset = Vector2(-32, 0)

	if pre_attack_move_offset != Vector2.ZERO:
		var tween_pre_attack = create_tween()
		# Use current global_position for the start of this tween
		tween_pre_attack.tween_property(self, "global_position", global_position + pre_attack_move_offset, pre_attack_move_duration).set_trans(Tween.TRANS_SINE)
		await tween_pre_attack.finished
		# Add pause after pre-attack movement
		await get_tree().create_timer(pre_attack_pause_duration).timeout

	# Now execute the attack animation sequence
	await play_attack_animation(target)

	# After attack animation, move back to the very original position
	var tween_final_return = create_tween()
	tween_final_return.tween_property(self, "global_position", original_position, attack_move_duration).set_trans(Tween.TRANS_SINE)
	await tween_final_return.finished

	is_attacking = false # Reset the flag after all movements are complete
	EventBus.after_attack.emit(self, target)

func hurt(area: Area2D):
	var opponent: Character = null # Initialize opponent

	# Check if the owner of the entering area is a Character
	if area.owner is Character:
		opponent = area.owner as Character
	else:
		opponent = area.opponent

	# If no valid opponent Character was found, exit
	if not opponent:
		printerr("Hurt triggered, but the entering area's owner is not a Character: ", area.owner)
		return
	# Proceed with hurt logic using the identified opponent
	EventBus.before_hurt.emit(self, opponent)
	var original_color = sprite.modulate
	sprite.modulate = Color.RED
	await get_tree().create_timer(0.1).timeout
	character_resource.HP -= opponent.character_resource.attack
	if character_resource.HP <= 0:
		die() # Call die method if HP is zero or less
	sprite.modulate = original_color
	EventBus.after_hurt.emit(self, opponent)

func is_alive() -> bool:
	return character_resource.HP > 0

func die():
	# TODO: Implement death logic, e.g., play death animation, emit signal, remove node
	print(character_resource.name + " has died.")
	if animation_player.has_animation("dying"):
		animation_player.play("dying")
		await animation_player.animation_finished
	queue_free() # Example: remove the character from the scene

<!-- Read File: character/character.gd.uid -->
uid://ctle6kj1fat3f

<!-- Read File: character/character_resource.gd -->
extends Resource
class_name CharacterResource

signal attack_changed(new_attack: int)
signal hp_changed(new_hp: int)

@export var name: String
@export var character_class: String
@export var type: String

var _attack: int = 0
@export var attack: int:
	get:
		return _attack
	set(value):
		if _attack != value:
			_attack = value
			attack_changed.emit(_attack) # 发出信号

var _hp: int = 0
@export var HP: int:
	get:
		return _hp
	set(new_hp):
		# 可以添加一些逻辑，比如确保 HP 不会低于 0
		if _hp != new_hp:
			_hp = new_hp
			hp_changed.emit(_hp) # 发出信号

func is_alive() -> bool:
	return _hp > 0

<!-- Read File: character/character_resource.gd.uid -->
uid://brvh42sjbp4qh

<!-- Read File: character/enemy/enemy.gd -->
extends Character
class_name Enemy

@export var hero_target: Hero
<!-- Read File: character/enemy/enemy.gd.uid -->
uid://biiv42r0opcg6

<!-- Read File: character/hero/archer/archer.gd -->
extends Hero
class_name Archer

@export var arrow_scene: PackedScene

@onready var arrow_spawn_point: Marker2D = $ArrowSpawnPoint


func play_attack_animation(target: Character):
	# Play attack animation (don't wait for it to finish here)
	animation_player.play("attack")

	# Wait 0.6 seconds (for animation timing)
	var arrow_timer = get_tree().create_timer(0.6)
	await arrow_timer.timeout

	# Instantiate and configure the arrow
	if arrow_scene:
		var arrow = arrow_scene.instantiate()
		arrow.opponent = self
		# Check if the arrow is valid
		if not is_instance_valid(arrow):
			push_error("Failed to instantiate arrow scene.")
			return # Cannot proceed without arrow

		# Add to the main scene tree to avoid position issues with parent movement
		get_tree().root.add_child(arrow) 
		arrow.global_position = arrow_spawn_point.global_position
		var angle = arrow.global_position.angle_to_point(target.global_position)
		arrow.rotation = angle
		
		# Tween the arrow towards the target
		var arrow_tween = create_tween()
		# Using LINEAR for consistent arrow speed (adjust if needed)
		arrow_tween.tween_property(arrow, "global_position", target.global_position, 0.3).set_trans(Tween.TRANS_LINEAR) 
		
		# Wait for the arrow hit signal OR the tween to finish as a fallback
		# Assumes the arrow scene has a signal named "hit"
		if arrow.has_signal("hit"):
			await arrow.hit
		else:
			push_warning("Arrow scene %s does not have a 'hit' signal. Waiting for tween to finish instead." % arrow_scene.resource_path)
			await arrow_tween.finished

	# Wait for the *entire* attack animation to finish if needed, 
	# or remove if the character should be ready sooner.
	await animation_player.animation_finished 


# Remove the original simple implementation:
# func play_attack_animation(target: Character):
#	 animation_player.play("attack")
	
	
<!-- Read File: character/hero/archer/archer.gd.uid -->
uid://3dvo4noy0l8y

<!-- Read File: character/hero/archer/arrow.gd -->
extends Area2D

signal hit

var opponent: Character

func _on_area_entered(_area:Area2D) -> void:
	hit.emit()
	await get_tree().create_timer(0.1).timeout
	queue_free()

<!-- Read File: character/hero/archer/arrow.gd.uid -->
uid://c5wx1n6am57dq

<!-- Read File: character/hero/hero.gd -->
extends Character
class_name Hero

@export var enemy_target: Character
<!-- Read File: character/hero/hero.gd.uid -->
uid://bxkmesef7heco

<!-- Read File: character/hero/mage/fire_ball.gd -->
extends Area2D

signal hit

var opponent: Character

func _on_area_entered(_area:Area2D) -> void:
	hit.emit()
	queue_free()

<!-- Read File: character/hero/mage/fire_ball.gd.uid -->
uid://c4goeurkcjkpg

<!-- Read File: character/hero/mage/mage.gd -->
extends Hero
class_name Mage

@export var fireball_scene: PackedScene

@onready var fireball_spawn_point: Sprite2D = $CreatingFireBallSprite

func play_attack_animation(target: Character):
	# Store the position before starting the attack animation sequence
	var start_position = global_position 

	# Play attack animation (don't wait for it to finish here)
	animation_player.play("attack")
	
	# Wait 0.9 seconds (e.g., for casting animation part)
	var fireball_timer = get_tree().create_timer(0.9)
	await fireball_timer.timeout

	# Instantiate and configure the fireball
	if fireball_scene:
		var fireball = fireball_scene.instantiate()
		fireball.opponent = self
		# Check if the fireball is valid and has the required signal
		if not is_instance_valid(fireball):
			push_error("Failed to instantiate fireball scene.")
			return # Cannot proceed without fireball

		# Add to the main scene tree to avoid position issues with parent movement
		get_tree().root.add_child(fireball) 
		fireball.global_position = fireball_spawn_point.global_position
		var angle = fireball.global_position.angle_to_point(target.global_position)
		fireball.rotation = angle
		
		# Tween the fireball towards the target
		var fireball_tween = create_tween()
		# Using CUBIC and EASE_IN for acceleration effect
		fireball_tween.tween_property(fireball, "global_position", target.global_position, 0.3).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN) 
		# Wait for the fireball hit signal OR the tween to finish as a fallback
		if fireball.has_signal("hit"):
			print("Waiting for fireball hit signal...") # Debug print
			await fireball.hit
			print("Fireball hit signal received.") # Debug print
		else:
			push_warning("Fireball scene %s does not have a 'hit' signal. Waiting for tween to finish instead." % fireball_scene.resource_path)
			await fireball_tween.finished

	# --- Remove original animation wait --- 
	# await animation_player.animation_finished 

	# Now that the fireball has hit (or finished moving), move the mage back
	var tween_move_back = create_tween() 
	tween_move_back.tween_property(self, "global_position", start_position, attack_move_duration).set_trans(Tween.TRANS_SINE)
	await tween_move_back.finished 


<!-- Read File: character/hero/mage/mage.gd.uid -->
uid://cnxfbm55vford

<!-- Read File: global/enemy_map.gd -->
extends Node

const ENEMY_CSV_PATH = "res://global/resource/enemy/enemy.csv"

var _enemies: Dictionary = {}

func _ready():
	_load_enemies_from_csv()

func _load_enemies_from_csv():
	if not FileAccess.file_exists(ENEMY_CSV_PATH):
		printerr("Enemy CSV file not found at path: ", ENEMY_CSV_PATH)
		return

	var file = FileAccess.open(ENEMY_CSV_PATH, FileAccess.READ)
	if file == null:
		printerr("Failed to open enemy CSV file. Error code: ", FileAccess.get_open_error())
		return

	# Adding log before reading header
	print("Starting to load enemies from: ", ENEMY_CSV_PATH)

	# Skip header line
	var header = file.get_csv_line()
	if header.is_empty():
		printerr("CSV header is empty in: ", ENEMY_CSV_PATH)
		file.close()
		return

	var column_count = header.size()
	# Adding log for expected columns based on header
	print("Expected column count based on header: ", column_count)
	# Explicitly check if header count is 7, as the error suggests
	if column_count != 7:
		printerr("Warning: Header columns count (", column_count, ") is not 7 in ", ENEMY_CSV_PATH)

	var line_number = 1 # Start counting after header
	while not file.eof_reached():
		# Adding log before reading each line
		print("Processing line ", line_number, " in ", ENEMY_CSV_PATH)

		var data = file.get_csv_line()
		var current_line_for_error = line_number # Store line number for potential error message
		line_number += 1

		# Skip empty lines or lines with incorrect column count
		# The original error likely comes from Godot's internal CSV parser when data.size() is wrong
		# But we add our own check/log here as well
		if data.is_empty() or data.size() != column_count:
			# Check for completely empty line often found at the end of CSV files
			if data.size() == 1 and data[0] == "":
				print("Detected empty line at line ", current_line_for_error ," (likely end of file), skipping.")
				continue
			elif not data.is_empty(): # Print warning only if line is not empty but malformed
				# Log the problematic line data
				printerr("Malformed CSV line detected at line ", current_line_for_error, ". Expected ", column_count, " columns, got ", data.size(), ". Data: ", data)
				# The original error you saw might be printed by Godot *before* this printerr,
				# but this log confirms which line caused it in *our* processing logic.
			else: # Handle other empty data cases if necessary
				print("Skipping potentially empty data line ", current_line_for_error, ".")

			continue

		var enemy_resource = EnemyResource.new()
		
		# Assign values safely, converting types
		enemy_resource.name = data[0]
		enemy_resource.character_class = data[1]
		enemy_resource.type = data[2]
		enemy_resource.attack = int(data[3]) if data[3].is_valid_int() else 0
		enemy_resource.HP = int(data[4]) if data[4].is_valid_int() else 0
		
		# Process skills
		var skill_keys_str = data[5]
		if not skill_keys_str.is_empty():
			var skill_keys = skill_keys_str.split("|")
			for skill_key in skill_keys:
				skill_key = skill_key.strip_edges() # Remove potential whitespace
				if not skill_key.is_empty():
					# Assuming a global SkillMap singleton exists
					var skill_resource = SkillMap.get_skill(skill_key) 
					if skill_resource:
						# Assuming EnemyResource has a 'skills' array property
						enemy_resource.skills.append(skill_resource) 
					else:
						printerr("Skill not found in SkillMap for key: '", skill_key, "' in enemy: ", enemy_resource.name)

		# Assign loot_level (index updated)
		enemy_resource.loot_level = int(data[6]) if data[6].is_valid_int() else 0

		if not enemy_resource.character_class.is_empty():
			if _enemies.has(enemy_resource.character_class):
				printerr("Duplicate enemy name found in CSV: ", enemy_resource.name, ". Overwriting.")
			_enemies[enemy_resource.character_class] = enemy_resource
		else:
			printerr("Skipping enemy entry with empty character_class at line ", current_line_for_error, ".")

	# Adding log after processing finishes
	print("Finished loading enemies from: ", ENEMY_CSV_PATH)
	file.close() # Ensure file is closed


func get_enemy(enemy_name: String) -> EnemyResource:
	"""
	Retrieves an EnemyResource by its name.
	Returns null if the enemy is not found.
	"""
	print("Getting enemy: ", _enemies)
	return _enemies.get(enemy_name, null)

<!-- Read File: global/enemy_map.gd.uid -->
uid://daj3qui0s6c27

<!-- Read File: global/event_bus.gd -->
extends Node

# magic card
signal magic_card_aim_started(magic_card: MagicCard)
signal magic_card_aim_ended(magic_card: MagicCard)

# 战斗阶段
signal battle_started
signal battle_ended

# 策略阶段
signal strategy_started
signal strategy_ended

# 行动
signal before_attack(source: Character, target: Character)
signal after_attack(source: Character, target: Character)
signal before_hurt(source: Character, opponent: Character)
signal after_hurt(source: Character, opponent: Character)

# 角色
signal character_died(character: CharacterResource)
signal character_level_up(character: CharacterResource)

<!-- Read File: global/event_bus.gd.uid -->
uid://c10px8a6nq4nd

<!-- Read File: global/magic_map.gd -->
extends Node

const MAGIC_CSV_PATH = "res://global/resource/magic/magic.csv"
const magic_resource: Script = preload("res://global/resource/magic/magic_card_resource.gd")
var magic_map: Dictionary = {}

func _ready():
	_load_magics()

func _load_magics():
	var file = FileAccess.open(MAGIC_CSV_PATH, FileAccess.READ)
	if file == null:
		printerr("Failed to open magic CSV file: ", MAGIC_CSV_PATH, " Error: ", FileAccess.get_open_error())
		return

	# Skip header line
	file.get_csv_line()

	while not file.eof_reached():
		var data = file.get_csv_line()
		if data.size() < 4: # Check if the row has enough columns
			if data.size() == 1 and data[0] == "": # Skip empty lines often found at the end of CSVs
				continue
			printerr("Skipping invalid row in ", MAGIC_CSV_PATH, ": ", data)
			continue

		var magic = magic_resource.new()
		magic.key = data[0].strip_edges()
		magic.name = data[1].strip_edges()
		magic.description = data[2].strip_edges()
		if data[3].strip_edges().is_valid_int():
			magic.unlock_level = int(data[3].strip_edges())
		else:
			printerr("Invalid unlock_level '", data[3], "' for magic_resource '", magic.key, "' in ", MAGIC_CSV_PATH)
			magic.unlock_level = 0 # Or handle the error as needed
		if data[5].strip_edges().is_valid_int():
			magic.price = int(data[5].strip_edges())
		else:
			printerr("Invalid cost '", data[5], "' for magic_resource '", magic.key, "' in ", MAGIC_CSV_PATH)
			magic.price = 10 # Or handle the error as needed

		if magic_map.has(magic.key):
			printerr("Duplicate magic_resource key found: ", magic.key, " in ", MAGIC_CSV_PATH)
		else:
			magic_map[magic.key] = magic
	file.close()

func get_magic(key: String) -> magic_resource:
	return magic_map.get(key)

# Optional: Function to get all magics
func get_all_magics() -> Dictionary:
	return magic_map.duplicate() # Return a copy to prevent external modification

func get_magic_by_level(level: int) -> Array:
	var magics: Array = []
	for magic in magic_map.values():
		if magic.unlock_level <= level:
			magics.append(magic)
	return magics 

<!-- Read File: global/magic_map.gd.uid -->
uid://bpsj2atvfn4u6

<!-- Read File: global/resource/effect/effect.gd -->
extends RefCounted
class_name Effect

func execute(_target: Array[Node]) -> void:
	pass










<!-- Read File: global/resource/effect/effect.gd.uid -->
uid://cubb3kq6yuaj5

<!-- Read File: global/resource/enemy/enemy_resource.gd -->
extends CharacterResource
class_name EnemyResource

@export var loot_level: int = 1
@export_group("Skills")
@export var skills: Array = [] # Will store skill resources

<!-- Read File: global/resource/enemy/enemy_resource.gd.uid -->
uid://bjxn3be2h260u

<!-- Read File: global/resource/hero/hero_resource.gd -->
extends CharacterResource
class_name HeroResource

@export var level: int = 1 # 假设 level 也有默认值
@export_group("Skills")
@export var skills: Array = [] # Will store skill resources

<!-- Read File: global/resource/hero/hero_resource.gd.uid -->
uid://b7thdb10bue3t

<!-- Read File: global/resource/magic/magic_card_resource.gd -->
extends Resource
class_name MagicCardResource

enum Target {
	SINGLE_HERO,
	ALL_HERO,
	ALL_ENEMIES,
	ENVIRONMENT,
}

@export_group("Card Attributes")
@export var key: String
@export var name: String
@export var target: Target
@export var unlock_level: int
@export var price: int

@export_group("Card Visuals")
@export var icon: Texture2D
@export var description: String

func is_single_target() -> bool:
	return target == Target.SINGLE_HERO
<!-- Read File: global/resource/magic/magic_card_resource.gd.uid -->
uid://bucjuhr3farq5

<!-- Read File: global/resource/skill/skill_resource.gd -->
extends Resource
class_name SkillResource

@export var key: String
@export var name: String
@export var description: String
@export var unlock_level: int

<!-- Read File: global/resource/skill/skill_resource.gd.uid -->
uid://hkf7be4bi1dw

<!-- Read File: global/resource/team_resource.gd -->
extends Resource
class_name TeamResource

signal team_data_changed

@export var gold: int = 10: set = set_gold
@export var magic_cards: Array[MagicCardResource] = []
@export var hero_team: Array[CharacterResource] = []
@export var level: int = 1

@export var level_up_cost: Array[int] = [2, 3, 4, 5, 6, 7, 8]

func get_level_up_cost() -> int:
	return level_up_cost[level - 1]

func set_gold(value: int) -> void:
	if gold != value:
		gold = value
		emit_signal("team_data_changed")

func level_up() -> void:
	if gold < get_level_up_cost():
		return
	var cost = get_level_up_cost() # Store cost before changing gold
	level += 1
	set_gold(gold - cost) # Use setter
	emit_signal("team_data_changed") # Emit for level change as well

func buy_magic_card(magic_card: MagicCardResource) -> bool:
	if gold < magic_card.price:
		return false
	print("buy magic card: ", magic_card.name)
	print("magic_card.price: ", magic_card.price)
	set_gold(gold - magic_card.price) # Use setter (already emits)
	print("gold: ", gold)
	magic_cards.append(magic_card)
	emit_signal("team_data_changed") # Emit for magic card change
	return true

func sell_magic_card(magic_card: MagicCardResource) -> bool:
	if not magic_cards.has(magic_card):
		return false
	set_gold(gold + magic_card.price) # Use setter (already emits)
	magic_cards.erase(magic_card)
	emit_signal("team_data_changed") # Emit for magic card change
	return true

func use_magic_card(magic_card: MagicCardResource) -> bool:
	if not magic_cards.has(magic_card):
		return false
	magic_cards.erase(magic_card)
	return true
<!-- Read File: global/resource/team_resource.gd.uid -->
uid://5lb3etyfipjy

<!-- Read File: global/resource_manager/resource_manager.gd -->
extends Node

func _ready():
	randomize()

func generate_random_hero() -> HeroResource:
	var hero_resource = HeroResource.new()
	
	# 随机选择职业
	var classes = ["knight", "archer", "mage"]
	hero_resource.character_class = classes[randi() % classes.size()]
	
	# 设置类型为 hero
	hero_resource.type = "hero"
	
	# 生成随机中文名字
	var first_names = ["艾", "布", "卡", "达", "伊", "弗", "格", "哈", "杰", "凯", "拉", "马", "纳", "欧", "佩", "奇", "瑞", "萨", "塔", "乌", "维", "沃", "希", "亚", "泽"]
	var second_names = ["伦", "伯", "克", "德", "恩", "弗", "格", "哈", "杰", "克", "尔", "姆", "纳", "欧", "普", "奇", "尔", "斯", "特", "尔", "文", "斯", "尔", "尔", "尔"]
	hero_resource.name = first_names[randi() % first_names.size()] + second_names[randi() % second_names.size()]
	
	# 设置等级为1
	hero_resource.level = 1

	# TODO 根据 character_class 设置初始属性
	hero_resource.attack = 2
	hero_resource.HP = 5

	print(hero_resource.skills)
	
	# 从 skill_map 中随机选择一个技能
	hero_resource.skills.append(get_random_skill())
	return hero_resource


func get_random_skill() -> SkillResource:
	var all_skills = SkillMap.get_all_skills()
	if all_skills.is_empty():
		printerr("SkillMap is empty!")
		return null
	
	var skill_keys = all_skills.keys()
	var random_skill_key = skill_keys[randi() % skill_keys.size()]
	return all_skills[random_skill_key]


func get_random_magic() -> MagicCardResource:
	var all_magics = MagicMap.get_all_magics()
	if all_magics.is_empty():
		printerr("MagicMap is empty!")
		return null

	var magic_keys = all_magics.keys()
	var random_magic_key = magic_keys[randi() % magic_keys.size()]
	return all_magics[random_magic_key]


func generate_enemy(enemy_key: String) -> EnemyResource:
	var enemy_resource = EnemyMap.get_enemy(enemy_key)
	if enemy_resource == null:
		printerr("Enemy resource not found in EnemyMap for key: ", enemy_key)
		return null
	return enemy_resource


<!-- Read File: global/resource_manager/resource_manager.gd.uid -->
uid://ki24ckfp7cfn

<!-- Read File: global/scene_manager/scene_manager.gd -->
extends Node

var team_resource: TeamResource

func _ready():
	team_resource = load("res://global/resource_manager/normal_team.tres")

func set_team(team: Array[CharacterResource]) -> void:
	team_resource.hero_team = team

func get_team() -> Array[CharacterResource]:
	return team_resource.hero_team

func get_gold() -> int:
	return team_resource.gold

func get_level() -> int:
	return team_resource.level

func get_magic_cards() -> Array[MagicCardResource]:
	return team_resource.magic_cards
<!-- Read File: global/scene_manager/scene_manager.gd.uid -->
uid://cf1rkm6fsm3k0

<!-- Read File: global/skill_map.gd -->
extends Node

const SKILL_CSV_PATH = "res://global/resource/skill/skills.csv"
const skill_resource: Script = preload("res://global/resource/skill/skill_resource.gd")
var skill_map: Dictionary = {}

func _ready():
	_load_skills()

func _load_skills():
	var file = FileAccess.open(SKILL_CSV_PATH, FileAccess.READ)
	if file == null:
		printerr("Failed to open skill CSV file: ", SKILL_CSV_PATH, " Error: ", FileAccess.get_open_error())
		return

	# Skip header line
	file.get_csv_line()

	while not file.eof_reached():
		var data = file.get_csv_line()
		if data.size() < 4: # Check if the row has enough columns
			if data.size() == 1 and data[0] == "": # Skip empty lines often found at the end of CSVs
				continue
			printerr("Skipping invalid row in ", SKILL_CSV_PATH, ": ", data)
			continue

		var skill = skill_resource.new()
		skill.key = data[0].strip_edges()
		skill.name = data[1].strip_edges()
		skill.description = data[2].strip_edges()
		if data[3].strip_edges().is_valid_int():
			skill.unlock_level = int(data[3].strip_edges())
		else:
			printerr("Invalid unlock_level '", data[3], "' for skill_resource '", skill.key, "' in ", SKILL_CSV_PATH)
			skill.unlock_level = 0 # Or handle the error as needed

		if skill_map.has(skill.key):
			printerr("Duplicate skill_resource key found: ", skill.key, " in ", SKILL_CSV_PATH)
		else:
			skill_map[skill.key] = skill
	file.close()

func get_skill(key: String) -> skill_resource:
	return skill_map.get(key)

# Optional: Function to get all skills
func get_all_skills() -> Dictionary:
	return skill_map.duplicate() # Return a copy to prevent external modification

func get_skill_by_level(level: int) -> Array:
	var skills: Array = []
	for skill in skill_map.values():
		if skill.unlock_level <= level:
			skills.append(skill)
	return skills

<!-- Read File: global/skill_map.gd.uid -->
uid://drr1mq1t38g7g

<!-- Read File: scene/combat_scene/combat_manager/combat_manager.gd -->
extends Node
class_name CombatManager

# 英雄队伍节点
@onready var hero_team: Node2D
# 敌人队伍节点
@onready var enemy_team: Node2D

# 存储英雄和敌人的数组
var heroes: Array[Character] = []
var enemies: Array[Character] = []

# 角色垂直间距和顶部偏移
@export var hero_vertical_spacing: float = 100.0
@export var enemy_vertical_spacing: float = 100.0
@export var hero_top_offset: float = 0.0
@export var enemy_top_offset: float = 0.0

# 战斗状态变量
var _battle_active: bool = false
var _is_hero_turn: bool = true # 标记是否轮到英雄行动
var _current_hero_index: int = -1 # 当前行动英雄索引
var _current_enemy_index: int = -1 # 当前行动敌人索引

# 初始化，获取队伍节点
func _ready():
	randomize() # Initialize random number generator
	hero_team = get_parent().get_node("HeroTeam")
	enemy_team = get_parent().get_node("EnemyTeam")
	if not hero_team:
		printerr("CombatManager: HeroTeam node not found.")
	if not enemy_team:
		printerr("CombatManager: EnemyTeam node not found.")

# 添加英雄到队伍
func add_hero(hero_resource: HeroResource):
	_add_character(hero_resource, heroes, hero_team, hero_vertical_spacing, hero_top_offset, "HeroTeam")

# 添加敌人到队伍
func add_enemy(enemy_resource: EnemyResource):
	_add_character(enemy_resource, enemies, enemy_team, enemy_vertical_spacing, enemy_top_offset, "EnemyTeam")

# 通用添加角色逻辑
func _add_character(char_resource: CharacterResource, team_array: Array[Character], team_node: Node2D, spacing: float, offset: float, team_name: String):
	if not char_resource:
		printerr("CombatManager: Tried to add null character resource to ", team_name)
		return
	if not team_node:
		printerr("CombatManager: Cannot add character, ", team_name, " node is missing.")
		return
	print("char_resource: ", char_resource)
	var character = Character.from_resource(char_resource)
	character.set_character_resource(char_resource)
	team_array.append(character)
	team_node.add_child(character)
	_arrange_team(team_array, spacing, offset)
	print("CombatManager: Added ", character.character_resource.character_class, " to ", team_name)


# 排列队伍角色位置
func _arrange_team(character_list: Array[Character], vertical_spacing: float, top_offset: float):
	if character_list.is_empty():
		return

	var count = character_list.size()
	var start_y = top_offset

	for i in range(count):
		var character = character_list[i]
		if is_instance_valid(character):
			character.position = Vector2(0, start_y + i * vertical_spacing)
		else:
			printerr("CombatManager: Found invalid character during arrangement.") # 发现无效角色

# 开始战斗
func start_battle():
	if heroes.is_empty() or enemies.is_empty():
		printerr("CombatManager: Cannot start battle with empty teams.") # 队伍空，无法开始
		return

	# 重置战斗状态
	_battle_active = true
	_is_hero_turn = true # 英雄先攻
	_current_hero_index = -1
	_current_enemy_index = -1

	print("--- Battle Started ---") # 战斗开始
	_next_turn()

# 进入下一回合 (轮流机制)
func _next_turn():
	if not _battle_active:
		return # 战斗未激活

	# 检查战斗是否已结束
	if _check_battle_over():
		return

	var attacker: Character = null
	var target_team: Array[Character]

	if _is_hero_turn:
		# 轮到英雄
		attacker = _find_next_alive_character(heroes, _current_hero_index)
		if attacker:
			_current_hero_index = heroes.find(attacker) # 更新当前英雄索引
			target_team = enemies.filter(func(e): return is_instance_valid(e) and e.is_alive()) # 目标：存活敌人
		else:
			printerr("CombatManager: No alive heroes found, but battle not over?") # 逻辑错误检查
			_end_battle(false) # 理论上不应发生，除非 _check_battle_over 失败
			return
	else:
		# 轮到敌人
		attacker = _find_next_alive_character(enemies, _current_enemy_index)
		if attacker:
			_current_enemy_index = enemies.find(attacker) # 更新当前敌人索引
			target_team = heroes.filter(func(h): return is_instance_valid(h) and h.is_alive()) # 目标：存活英雄
		else:
			printerr("CombatManager: No alive enemies found, but battle not over?") # 逻辑错误检查
			_end_battle(true) # 理论上不应发生
			return

	# 检查目标队伍是否为空 (虽然_check_battle_over应该已处理)
	if target_team.is_empty():
		printerr("CombatManager: Target team empty after attacker selected.") # 逻辑错误检查
		_end_battle(_is_hero_turn) # 如果英雄攻击，敌人为空则英雄胜，反之亦然
		return

	# 选择随机目标
	var target = target_team[randi() % target_team.size()]

	var turn_owner_string = "Hero" if _is_hero_turn else "Enemy"
	print("Turn: ", turn_owner_string, " ", attacker.character_resource.character_class, " attacks ", target.character_resource.character_class) # 回合信息

	# TODO: 实现攻击逻辑
	await attacker.attack(target)

	# 切换回合方
	_is_hero_turn = not _is_hero_turn

	# 攻击后等待
	await get_tree().create_timer(1.0).timeout # 缩短等待时间为1秒

	# 延迟调用下一回合
	call_deferred("_next_turn")

# 查找队伍中下一个存活的角色
func _find_next_alive_character(team: Array[Character], current_index: int) -> Character:
	if team.is_empty():
		return null
	var start_index = (current_index + 1) % team.size()
	for i in range(team.size()):
		var check_index = (start_index + i) % team.size()
		var character = team[check_index]
		if is_instance_valid(character) and character.is_alive():
			return character
	return null # 没有找到存活的角色
# 移除英雄
func remove_hero(hero: Character):
	_remove_character(hero, heroes, hero_vertical_spacing, hero_top_offset)

# 移除敌人
func remove_enemy(enemy: Character):
	_remove_character(enemy, enemies, enemy_vertical_spacing, enemy_top_offset)

# 通用移除角色逻辑
func _remove_character(character: Character, team_array: Array[Character], spacing: float, offset: float):
	if team_array.has(character):
		var index = team_array.find(character)
		team_array.erase(character)
		# 如果移除的是当前回合或之前的角色，可能需要调整索引
		# 为简单起见，暂时不处理移除对当前回合索引的精确影响，依赖 _find_next_alive_character 查找
		if is_instance_valid(character):
			character.queue_free() # 释放节点
		_arrange_team(team_array, spacing, offset) # 重新排列队伍

# 检查战斗是否结束
func _check_battle_over() -> bool:
	var alive_heroes = heroes.filter(func(h): return is_instance_valid(h) and h.is_alive()).size()
	var alive_enemies = enemies.filter(func(e): return is_instance_valid(e) and e.is_alive()).size()

	if alive_heroes == 0:
		_end_battle(false) # 英雄全灭
		return true
	elif alive_enemies == 0:
		_end_battle(true) # 敌人全灭
		return true
	return false # 战斗继续

# 结束战斗
func _end_battle(heroes_won: bool):
	if not _battle_active: return # 防止重复调用
	_battle_active = false
	# _turn_queue.clear() # 已移除
	_current_hero_index = -1
	_current_enemy_index = -1
	if heroes_won:
		print("--- Battle Ended: Heroes Win! ---") # 英雄胜利
	else:
		print("--- Battle Ended: Enemies Win! ---") # 敌人胜利
	# TODO: 添加战斗结束后的逻辑，如返回场景、显示结果等

<!-- Read File: scene/combat_scene/combat_manager/combat_manager.gd.uid -->
uid://bjnrvy8xpfk13

<!-- Read File: scene/combat_scene/combat_scene.gd -->
extends Node2D
class_name BattleScene

# Keep the @onready vars if you still need direct access from the scene script,
# but CombatManager now gets them via get_parent().get_node()
@onready var hero_team: Node2D = %HeroTeam 
@onready var enemy_team: Node2D = %EnemyTeam
@onready var combat_manager: CombatManager = %CombatManager

func _ready():
	print("BattleScene: Entering _ready()")

	if not combat_manager:
		printerr("BattleScene: CombatManager node not found!")
		return

	# --- Hero Team Initialization ---
	print("BattleScene: Starting hero team generation...")
	var hero_count = 4 # Example count
	for i in range(hero_count):
		var hero_resource = ResourceManager.generate_random_hero()
		if hero_resource:
			print("BattleScene: Generated hero resource: ", hero_resource.name, " (", hero_resource.character_class, ")")
			combat_manager.add_hero(hero_resource) # CombatManager handles instantiation and positioning
		else:
			printerr("BattleScene: Failed to generate hero resource at index ", i)
	print("BattleScene: Finished hero team generation.")

	# --- Enemy Team Initialization ---
	var enemy_count = 8 # Example count
	var enemy_type = "skeleton" # Example type
	print("BattleScene: Starting enemy team generation...")
	for i in range(enemy_count):
		var enemy_resource = ResourceManager.generate_enemy(enemy_type)
		if enemy_resource:
			# Create unique names or handle potential duplicates if needed
			enemy_resource.name = enemy_type + str(i + 1) 
			print("BattleScene: Generated enemy resource: ", enemy_resource.name)
			combat_manager.add_enemy(enemy_resource) # CombatManager handles instantiation and positioning
		else:
			printerr("BattleScene: Failed to generate enemy resource '", enemy_type, "' at index ", i)
	print("BattleScene: Finished enemy team generation.")

	# Start the battle sequence via CombatManager
	print("BattleScene: Starting battle via CombatManager...")
	combat_manager.start_battle()
	print("BattleScene: Battle sequence initiated.")

	print("BattleScene: Exiting _ready()")

func _process(_delta: float) -> void:
	# The main game loop or specific scene logic can go here.
	# Combat turns are now handled within CombatManager.
	pass

<!-- Read File: scene/combat_scene/combat_scene.gd.uid -->
uid://cqe3r2lvkup6u

<!-- Read File: scene/combat_scene/slot/slot.gd -->
extends Node2D
class_name Slot

@onready var highlight: Sprite2D = $Highlight

var character: Character
@export_enum("front", "back") var type: String = "front"


func _on_area_2d_mouse_exited() -> void:
	highlight.modulate.a = 0.0

func _on_area_2d_mouse_entered() -> void:
	highlight.modulate.a = 0.3

func is_free() -> bool:
	return character == null

<!-- Read File: scene/combat_scene/slot/slot.gd.uid -->
uid://da0o4gje7eav1

<!-- Read File: scene/combat_scene/slot/team.gd -->
extends Node2D
class_name Team


<!-- Read File: scene/combat_scene/slot/team.gd.uid -->
uid://b36c6p36rcy2v

<!-- Read File: scene/magic_card_target_selector/arc.gd -->
extends Line2D
class_name Arc
<!-- Read File: scene/magic_card_target_selector/arc.gd.uid -->
uid://ci8m73vxo7klh

<!-- Read File: scene/magic_card_target_selector/magic_card_target_selector.gd -->
extends Node2D

const arc_points := 8

@onready var area_2d: Area2D = $Area2D
@onready var arc: Line2D = $CanvasLayer/Arc

var current_card: MagicCard
var targeting := false

func _ready() -> void:
	EventBus.magic_card_aim_started.connect(_on_magic_card_aim_started)
	EventBus.magic_card_aim_ended.connect(_on_magic_card_aim_ended)

func _process(_delta: float) -> void:
	if not targeting:
		return
	area_2d.position = get_local_mouse_position()
	arc.points = _get_points()

func _get_points() -> Array:
	var points := []
	var start := current_card.global_position
	start.x += (current_card.size.x /2)
	var target := get_local_mouse_position()
	var distance := (target - start)

	for i in range(arc_points):
		var t := (1.0 / arc_points) * i
		var x := start.x + (distance.x / arc_points) * i
		var y := start.y + ease_out_cubic(t) * distance.y
		points.append(Vector2(x, y))
	points.append(target)
	return points

func ease_out_cubic(number: float) -> float:
	return 1.0 - pow(1.0 - number, 3.0)

func _on_magic_card_aim_started(card: MagicCard) -> void:
	print("magic_card_aim_started: ", card.magic_resource.name)
	print("is_single_target: ", card.magic_resource.is_single_target())
	if not card.magic_resource.is_single_target():
		return
	targeting = true
	area_2d.monitoring = true
	area_2d.monitorable = true
	current_card = card

func _on_magic_card_aim_ended(_card: MagicCard) -> void:
	print("magic_card_aim_ended: ", _card.magic_resource.name)
	targeting = false
	arc.clear_points()
	area_2d.position = Vector2.ZERO
	area_2d.monitoring = false
	area_2d.monitorable = false
	current_card = null

func _on_area_2d_area_exited(area:Area2D) -> void:
	if not current_card or not targeting:
		return
	current_card.targets.erase(area)

func _on_area_2d_area_entered(area:Area2D) -> void:
	if not current_card or not targeting:
		return
	if not current_card.targets.has(area):
		current_card.targets.append(area)
	
<!-- Read File: scene/magic_card_target_selector/magic_card_target_selector.gd.uid -->
uid://gbpedl176kaj

<!-- Read File: scene/preparation_scene/preparation_scene.gd -->
extends Node2D
class_name PreparationScene

@onready var hero_card_grid: GridContainer = %HeroCardGrid
@onready var team_container: VBoxContainer = %TeamContainer
@onready var finish_button: Button = %FinishButton

const hero_card_scene = preload("res://ui/hero_card/hero_card.tscn")
const HeroUI = preload("res://ui/hero_ui/hero_ui.gd")
const HeroCard = preload("res://ui/hero_card/hero_card.gd") # Added preload for type checking
const MAX_TEAM_SIZE = 4 # Define the maximum team size

var current_team_resources: Array[CharacterResource] = []

func _ready():
	for i in range(10):
		var card = hero_card_scene.instantiate()
		var hero_res = ResourceManager.generate_random_hero()
		card.set_character_resource(hero_res) # Use the setter function
		hero_card_grid.add_child(card)
		card.join_button_pressed.connect(_join_team)
	_update_ui_states() # Update UI states initially

func _join_team(hero_res: CharacterResource):
	# Check if team is full (redundant check as button state handles this, but good safeguard)
	if team_container.get_child_count() >= MAX_TEAM_SIZE:
		print("Team is full!") # Replace with user-facing feedback if needed
		return

	# Check for duplicates (This check remains important)
	for member in team_container.get_children():
		if member is HeroUI and member.character_resource == hero_res:
			print("Hero is already in the team!") # Replace with user-facing feedback
			return

	# Add hero to the team
	var hero_ui: HeroUI = HeroUI.from_resource()
	hero_ui.set_character_resource(hero_res)
	hero_ui.exit_button_pressed.connect(_remove_from_team.bind(hero_ui)) # Removed hero_res binding as it's accessible via hero_ui_instance
	team_container.add_child(hero_ui)

	# Update UI states
	_update_ui_states()


func _remove_from_team(hero_ui_instance: HeroUI):
	# Remove the hero UI from the team container
	team_container.remove_child(hero_ui_instance)
	hero_ui_instance.queue_free() # Ensure the instance is freed from memory

	# Update UI states
	_update_ui_states()


# Helper function to update the enabled/disabled state of buttons and team list
func _update_ui_states():
	# Rebuild the current team resource list based on the UI elements
	current_team_resources.clear()
	for member in team_container.get_children():
		if member is HeroUI:
			current_team_resources.append(member.character_resource)

	var is_team_full = current_team_resources.size() >= MAX_TEAM_SIZE

	# Update finish button state
	finish_button.disabled = current_team_resources.size() != MAX_TEAM_SIZE

	# Update join buttons on hero cards
	for card in hero_card_grid.get_children():
		if card is HeroCard:
			if card.join_button: # Check if the button exists
				# Disable if team is full OR if this hero is already in the team
				if is_team_full or card.hero_resource in current_team_resources:
					card.join_button.disabled = true
				else:
					card.join_button.disabled = false


func _on_finish_button_pressed() -> void: # Renamed from _on_button_pressed to match signal likely connected in editor
	print("Team finalized: ", current_team_resources.size())
	SceneManager.set_team(current_team_resources)
	print("Team set: ", SceneManager.get_team())
	# SceneManager.go_to_battle_scene()

<!-- Read File: scene/preparation_scene/preparation_scene.gd.uid -->
uid://b7ps6aj22jl7f

<!-- Read File: scene/strategy_scene/hand.gd -->
extends HBoxContainer
class_name Hand

# Removed _ready, add_magic_card_to_hand, and signal handling.
<!-- Read File: scene/strategy_scene/hand.gd.uid -->
uid://bwnkp50vcvj7d

<!-- Read File: scene/strategy_scene/magic_card_grid.gd -->
extends GridContainer
class_name MagicCardGrid

# Removed _ready, add_magic_card_to_store, and signal handling.
<!-- Read File: scene/strategy_scene/magic_card_grid.gd.uid -->
uid://dwy1qhxu6mhm1

<!-- Read File: scene/strategy_scene/strategy_scene.gd -->
extends Node2D
class_name StrategyScene

const hero_ui_scene = preload("res://ui/hero_ui/hero_ui.tscn") # Added
const magic_card_scene = preload("res://ui/magic_card/magic_card.tscn") # Added preload for magic card
var available_magics = []

@onready var team_container: VBoxContainer = %TeamContainer
@onready var magic_card_grid: GridContainer = %MagicCardGrid
@onready var hand: HBoxContainer = %Hand
@onready var level_label: Label = %LevelLabel
@onready var gold_label: Label = %GoldLabel
@onready var level_up_button: Button = %LevelUpButton

func _ready():
	# Connect the team_data_changed signal BEFORE the initial sync
	if SceneManager.team_resource and not SceneManager.team_resource.team_data_changed.is_connected(_sync_team_data):
		SceneManager.team_resource.team_data_changed.connect(_sync_team_data)

	_sync_team_data() # Initial sync
	_select_random_magic_cards()
	_generate_test_heroes()

func _sync_team_data():
	# Get data from SceneManager using getters
	var gold = SceneManager.get_gold() # Use getter
	var level = SceneManager.get_level() # Use getter

	# Update Labels
	level_label.text = "Level: %d" % level
	gold_label.text = str(gold)

	# Hide level up button if level is 6 or more
	if level >= 6:
		level_up_button.visible = false
	else:
		level_up_button.visible = true

func _generate_test_heroes():
	# Clear existing heroes if any
	for child in team_container.get_children():
		child.queue_free()

	# Add 4 test hero UI instances with random hero data
	for i in range(4):
		var hero_instance = hero_ui_scene.instantiate()
		var hero_res = ResourceManager.generate_random_hero() # Generate random hero
		if hero_res: # Check if hero generation was successful
			hero_instance.set_character_resource(hero_res) # Set the resource on the UI
		else:
			printerr("Failed to generate random hero for test slot ", i)
		hero_instance.show_exit_button = false
		team_container.add_child(hero_instance)

func _select_random_magic_cards():
	var team_level = SceneManager.get_level() # Use getter
	var all_magics = MagicMap.get_all_magics().values() # Get magic resources as an array

	# Clear previous available magics before filtering again
	available_magics.clear()

	# Filter magics based on unlock_level
	for magic in all_magics:
		if magic.unlock_level and magic.unlock_level <= team_level:
			available_magics.append(magic)

	# Shuffle the available magics
	available_magics.shuffle()

	# Limit available_magics to 6
	if available_magics.size() > 6:
		available_magics.resize(6)

	_display_magic_cards()

func _display_magic_cards():
	# Clear existing magic cards from the grid
	for child in magic_card_grid.get_children():
		child.queue_free()

	# Instantiate and add magic cards to the grid
	for i in range(available_magics.size()): # Use index for storing original position
		var magic_res = available_magics[i]
		var card_instance = magic_card_scene.instantiate()
		# Set the magic resource for the card instance
		card_instance.set_magic_resource(magic_res)
		# Store the original index in the store grid
		card_instance.store_index = i
		# Connect reparenting signals
		card_instance.reparent_to_store_requested.connect(_on_magic_card_reparent_to_store)
		card_instance.reparent_to_hand_requested.connect(_on_magic_card_reparent_to_hand)
		# Add the card to the grid (GridContainer handles positioning)
		magic_card_grid.add_child(card_instance)
		# Explicitly move to ensure order if add_child doesn't guarantee it initially
		# or if children were previously removed non-sequentially.
		magic_card_grid.move_child(card_instance, i)

func _on_level_up_button_pressed() -> void:
	# Keep accessing team_resource here to call level_up method
	var team_resource = SceneManager.team_resource
	team_resource.level_up() # This will now trigger the signal via the setter
	# _sync_team_data() # No longer need to call manually here, signal handles it

func _on_refresh_button_pressed() -> void:
	# Refresh should likely only reroll cards still in the store,
	# not affect cards already in the hand. This logic might need adjustment.
	# For now, assume it rerolls everything shown in the store grid.
	_select_random_magic_cards()

# Handler for reparenting card to the store grid
func _on_magic_card_reparent_to_store(card: MagicCard):
	var original_store_index = card.store_index
	if card.get_parent() == magic_card_grid:
		# Already in the grid, ensure position (might be redundant for GridContainer)
		if original_store_index != -1 and original_store_index < magic_card_grid.get_child_count():
			magic_card_grid.move_child(card, original_store_index)
		return

	var current_parent = card.get_parent()
	if current_parent:
		current_parent.remove_child(card)

	magic_card_grid.add_child(card)
	card.parent = magic_card_grid # Manually assign the custom parent variable
	# GridContainer manages layout, but move_child sets sibling index which might matter
	if original_store_index != -1 and original_store_index < magic_card_grid.get_child_count():
		magic_card_grid.move_child(card, original_store_index)
	else:
		# If index is invalid, place it at the end and update its stored index
		card.store_index = magic_card_grid.get_child_count() - 1

	card.hand_index = -1 # Clear hand index
	print("Card %s moved to store at index %d" % [card.magic_resource.name, card.store_index])

# Handler for reparenting card to the hand
func _on_magic_card_reparent_to_hand(card: MagicCard):
	var original_hand_index = card.hand_index
	if card.get_parent() == hand:
		# Already in hand, ensure position
		if original_hand_index != -1 and original_hand_index < hand.get_child_count():
			hand.move_child(card, original_hand_index)
		return

	var current_parent = card.get_parent()
	if current_parent:
		current_parent.remove_child(card)

	hand.add_child(card)
	card.parent = hand # Manually assign the custom parent variable
	# Use move_child to place it at the correct index in HBoxContainer
	if original_hand_index != -1 and original_hand_index < hand.get_child_count():
		hand.move_child(card, original_hand_index)
	else:
		# First time in hand or index lost, place at end and store new index
		card.hand_index = hand.get_child_count() - 1

	card.store_index = -1 # Clear store index
	print("Card %s moved to hand at index %d" % [card.magic_resource.name, card.hand_index])

<!-- Read File: scene/strategy_scene/strategy_scene.gd.uid -->
uid://c88hjmra1vmh1

<!-- Read File: ui/animated_texture_rect/animation_texture_rect.gd -->
@tool
extends TextureRect
class_name AnimationTextureRect

@export var sprites: SpriteFrames
@export var current_animation = "default"
@export var frame_index := 0
@export_range(0.0, INF, 0.001) var speed_scale := 1.0
@export var autoplay := false
@export var playing := false

var refresh_rate = 1.0
var fps = 30.0
var frame_delta = 0

func _ready():
    fps = sprites.get_animation_speed(current_animation)
    refresh_rate = sprites.get_frame_duration(current_animation, frame_index)
    if autoplay:
        play()

func _process(delta: float) -> void:
    if sprites == null or playing == false:
        return
    if sprites.has_animation(current_animation) == false:
        playing = false
        assert(false, "Animation %s, does not exist" % current_animation)
    get_animation_data(current_animation)
    frame_delta += (speed_scale * delta)
    if frame_delta >= refresh_rate/fps:
        texture = get_next_frame()

func play(animation_name :String = current_animation):
    frame_index = 0
    frame_delta = 0.0
    current_animation = animation_name
    get_animation_data(animation_name)
    playing = true

func get_animation_data(animation_name :String):
    fps = sprites.get_animation_speed(animation_name)
    refresh_rate = sprites.get_frame_duration(animation_name, frame_index)

func get_next_frame():
    frame_index += 1
    var frame_count = sprites.get_frame_count(current_animation)
    if frame_index >= frame_count:
        frame_index = 0
        if not sprites.get_animation_loop(current_animation):
            playing = false
    get_animation_data(current_animation)
    return sprites.get_frame_texture(current_animation, frame_index)

func resume():
    playing = true

func pause():
    playing = false

func stop():
    playing = false
    frame_index = 0
<!-- Read File: ui/animated_texture_rect/animation_texture_rect.gd.uid -->
uid://ci75qfhco4dwr

<!-- Read File: ui/hero_card/hero_card.gd -->
extends Control
class_name HeroCard

signal join_button_pressed(hero_resource: CharacterResource)

# Preload the SkillDisplay scene (adjust path if needed)
const SKILL_DISPLAY_SCENE = preload("res://ui/skill_display/skill_display.tscn")

@export var show_join_button: bool

@export var hero_resource: CharacterResource: set = set_character_resource

@onready var hero_photo: TextureRect = %HeroPhoto
@onready var hero_name: Label = %HeroName
@onready var attack_label: Label = %AttackLabel
@onready var hp_label: Label = %HPLabel
@onready var skill_container: VBoxContainer = %SkillContainer
@onready var join_button: Button = %JoinButton

func set_character_resource(new_resource: CharacterResource):
	# Disconnect signals from the old resource if it exists and is valid
	if hero_resource and is_instance_valid(hero_resource):
		if hero_resource.is_connected("attack_changed", Callable(self, "update_card")):
			hero_resource.disconnect("attack_changed", Callable(self, "update_card"))
		if hero_resource.is_connected("hp_changed", Callable(self, "update_card")):
			hero_resource.disconnect("hp_changed", Callable(self, "update_card"))

	hero_resource = new_resource

	if hero_resource and is_instance_valid(hero_resource):
		# Connect signals to update_card
		# Ensure the signals exist before connecting
		if hero_resource.has_signal("attack_changed"):
			hero_resource.attack_changed.connect(update_card)
		if hero_resource.has_signal("hp_changed"):
			hero_resource.hp_changed.connect(update_card)

	# Update the card display immediately
	# Use call_deferred to ensure nodes are ready if called early
	call_deferred("update_card")

func update_card():
	if not is_node_ready():
		await ready # Ensure nodes are ready before accessing them

	if hero_resource:
		hero_name.text = hero_resource.name if hero_resource.name else "N/A"
		attack_label.text = str(hero_resource.attack) if hero_resource.attack else "N/A"
		hp_label.text = str(hero_resource.HP) if hero_resource.HP else "N/A"
		hero_photo.texture = load("res://art/texture/character/"+ hero_resource.character_class +".tres")

		# Update skills
		# Clear existing skills
		for child in skill_container.get_children():
			child.queue_free()

		# Add new skills if the scene is loaded and the resource has skills
		if SKILL_DISPLAY_SCENE and hero_resource.skills:
			for skill in hero_resource.skills: # Assuming hero_resource.skills is an array
				var skill_display = SKILL_DISPLAY_SCENE.instantiate()
				skill_container.add_child(skill_display)
				if skill_display.has_method("set_skill_resource"):
					skill_display.set_skill_resource(skill)
				else:
					printerr("SkillDisplay scene at %s does not have set_skill_resource method." % SKILL_DISPLAY_SCENE.resource_path)
		elif not SKILL_DISPLAY_SCENE:
			printerr("SkillDisplay scene could not be preloaded. Check the path.")
	else:
		# Set default values if no resource
		hero_name.text = "N/A"
		attack_label.text = "N/A"
		hp_label.text = "N/A"
		hero_photo.texture = null # Or set a default placeholder texture
		# Clear skills if no resource
		for child in skill_container.get_children():
			child.queue_free()


func _on_join_button_pressed() -> void:
	join_button_pressed.emit(hero_resource)

<!-- Read File: ui/hero_card/hero_card.gd.uid -->
uid://ctc2dadxl1qkq

<!-- Read File: ui/hero_ui/hero_ui.gd -->
extends Control
class_name HeroUI

signal exit_button_pressed

const HeroUIScene = preload("res://ui/hero_ui/hero_ui.tscn")

@export var show_exit_button: bool = true
var character_resource: CharacterResource

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var attack_label: Label = $AnimatedSprite2D/AttackLabel
@onready var hp_label: Label = $AnimatedSprite2D/HPLabel
@onready var exit_button: Button = $ExitButton

static func from_resource() -> Control:
	var instance = HeroUIScene.instantiate()
	return instance

func _process(_delta: float) -> void:
	if show_exit_button:
		exit_button.show()
	else:
		exit_button.hide()

func set_character_resource(resource: CharacterResource):
	# Assuming animation names match character_class names
	await ready
	print("resource.character_class: ", resource.character_class)
	print("resource.attack: ", resource.attack)
	print("resource.HP: ", resource.HP)
	attack_label.text = str(resource.attack)
	hp_label.text = str(resource.HP)
	character_resource = resource
	animated_sprite.play(resource.character_class)

func _on_exit_button_pressed() -> void:
	exit_button_pressed.emit()

<!-- Read File: ui/hero_ui/hero_ui.gd.uid -->
uid://drh2a0dbs07i

<!-- Read File: ui/magic_card/magic_card.gd -->
extends Control
class_name MagicCard

signal buy_button_pressed(magic_resource: MagicCardResource)
signal reparent_to_hand_requested(which_card: MagicCard)
signal reparent_to_store_requested(which_card: MagicCard)

# Preload the SkillDisplay scene (adjust path if needed)
const SKILL_DISPLAY_SCENE = preload("res://ui/skill_display/skill_display.tscn")

@export var show_magic_button: bool

@export var magic_resource: MagicCardResource: set = set_magic_resource

# Add index variables
var store_index: int = -1
var hand_index: int = -1

@onready var magic_texture: TextureRect = %MagicTexture
@onready var magic_name: Label = %MagicName
@onready var magic_description: Label = %MagicDescription
@onready var drop_point_detector: Area2D = %DropPointDetector
@onready var magic_card_state_machine: MagicCardStateMachine = $MagicCardStateMachine
@onready var targets: Array[Node] = []

@export var is_on_sale := true
var parent: Control
var tween: Tween

# for debug
@onready var color: ColorRect = $Color

func _ready():
	magic_card_state_machine.init(self)
	# Update card visuals if resource is set on initialization
	if magic_resource:
		update_card()

func set_magic_resource(new_resource: MagicCardResource):
	magic_resource = new_resource
	# Reset indices when resource changes, though this might need refinement
	# depending on when resources are set vs. when cards are placed.
	# For now, let's assume indices are set when added to containers.
	# store_index = -1 
	# hand_index = -1
	# Don't call update_card here, wait for _ready or explicit calls
	# Ensure card updates if it's already ready when the resource is changed later
	if is_node_ready():
		update_card()

func update_card() -> void:
	# Ensure node is ready before accessing @onready vars
	if not is_node_ready():
		await ready # Wait until the node is ready
	if magic_resource:
		# Check if nodes are valid before accessing them
		if magic_name:
			magic_name.text = magic_resource.name
		if magic_description:
			magic_description.tooltip_text = magic_resource.description
		# Load texture based on key
		var texture_path = "res://art/skill_icon/{key}.png".format({"key": magic_resource.key})
		var loaded_texture = load(texture_path)
		if magic_texture:
			magic_texture.texture = loaded_texture
	else:
		# Check if nodes are valid before clearing them
		if magic_name:
			magic_name.text = ""
		if magic_description:
			magic_description.tooltip_text = ""
		if magic_texture:
			magic_texture.texture = null
func set_drop_point_detector_mask(mask_index: int) -> void:
	if drop_point_detector:
		drop_point_detector.collision_mask = mask_index

func animate_to_position(new_position: Vector2, duration: float) -> void:
	tween = create_tween().set_trans(Tween.TRANS_CIRC).set_ease(Tween.EASE_OUT)
	tween.tween_property(self, "global_position", new_position, duration)

func _input(event: InputEvent) ->void:
	magic_card_state_machine.on_input(event)

func _on_gui_input(event:InputEvent) -> void:
	magic_card_state_machine.on_gui_input(event)

func _on_mouse_entered() -> void:
	magic_card_state_machine.on_mouse_entered()

func _on_mouse_exited() -> void:
	magic_card_state_machine.on_mouse_exited()

func _on_drop_point_detector_area_exited(area:Area2D) -> void:
	targets.erase(area)

func _on_drop_point_detector_area_entered(area:Area2D) -> void:
	if not targets.has(area):
		targets.append(area)

<!-- Read File: ui/magic_card/magic_card.gd.uid -->
uid://bofh8neu50jfx

<!-- Read File: ui/magic_card/magic_card_state/magic_card_aiming_state.gd -->
extends MagicCardState

func enter() -> void:
	magic_card.color.color = Color.WEB_PURPLE
	magic_card.targets.clear()
	var offset := Vector2(magic_card.parent.size.x / 2, -magic_card.size.y / 2)
	offset.x -= magic_card.size.x / 2
	magic_card.animate_to_position(magic_card.parent.global_position + offset, 0.2)
	magic_card.drop_point_detector.monitoring = false
	EventBus.magic_card_aim_started.emit(magic_card)

func exit() -> void:
	print("aiming exited")
	EventBus.magic_card_aim_ended.emit(magic_card)

func on_input(event: InputEvent) -> void:
	if event.is_action_pressed("right_mouse"):
		transition_requested.emit(self, MagicCardState.State.BASE)
	elif event.is_action_released("left_mouse") or event.is_action_pressed("left_mouse"):
		get_viewport().set_input_as_handled()
		print("try to release")
		transition_requested.emit(self, MagicCardState.State.RELEASED)

<!-- Read File: ui/magic_card/magic_card_state/magic_card_aiming_state.gd.uid -->
uid://mlsam613mhi1

<!-- Read File: ui/magic_card/magic_card_state/magic_card_base_state.gd -->
extends MagicCardState

func enter() -> void:
	print("enter base state")
	if not magic_card.is_node_ready():
		await magic_card.ready

	if magic_card.tween and magic_card.tween.is_running():
		magic_card.tween.kill()
	print("reparent to hand requested")
	magic_card.reparent_to_hand_requested.emit(magic_card)
	magic_card.color.color = Color.WEB_GREEN
	magic_card.pivot_offset = Vector2.ZERO
	magic_card.is_on_sale = false

func on_gui_input(event: InputEvent) -> void:
	if event.is_action_pressed("left_mouse"):
		magic_card.pivot_offset = magic_card.get_global_mouse_position() - magic_card.global_position
		transition_requested.emit(self, MagicCardState.State.CLICKED)

<!-- Read File: ui/magic_card/magic_card_state/magic_card_base_state.gd.uid -->
uid://c6xo4tjqwpl3j

<!-- Read File: ui/magic_card/magic_card_state/magic_card_buying_state.gd -->
extends MagicCardState

func enter() -> void:
	if not magic_card.is_on_sale:
		transition_requested.emit.call_deferred(self, MagicCardState.State.BASE)
		return
	var buy_success := SceneManager.team_resource.buy_magic_card(magic_card.magic_resource)
	if not buy_success:
		transition_requested.emit.call_deferred(self, MagicCardState.State.ONSALE)
		return
	magic_card.color.color = Color.ORANGE
	transition_requested.emit.call_deferred(self, MagicCardState.State.BASE)

<!-- Read File: ui/magic_card/magic_card_state/magic_card_buying_state.gd.uid -->
uid://mhc2uf5qjbbr

<!-- Read File: ui/magic_card/magic_card_state/magic_card_clicked_state.gd -->
extends MagicCardState

func enter() -> void:
	magic_card.color.color = Color.ORANGE
	magic_card.drop_point_detector.monitoring = true

func on_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		transition_requested.emit(self, MagicCardState.State.DRAGGING)
<!-- Read File: ui/magic_card/magic_card_state/magic_card_clicked_state.gd.uid -->
uid://d1ofmdts0cxnp

<!-- Read File: ui/magic_card/magic_card_state/magic_card_dragging_state.gd -->
extends MagicCardState

const drag_minimum_threshold := 0.02
# Collision layer bits (assuming layer 10 for hand, 11 for store)
const CARD_DROP_AREA_BIT = 9 # Layer 10
const HAND_DROP_AREA_BIT = 10 # Layer 11
const CARD_DROP_AREA_MASK = 1 << CARD_DROP_AREA_BIT
const HAND_DROP_AREA_MASK = 1 << HAND_DROP_AREA_BIT

var minimum_drag_time_elapsed := false

func enter() -> void:
	var ui_layer := get_tree().get_first_node_in_group("ui_layer")
	if ui_layer:
		magic_card.reparent(ui_layer)
	magic_card.color.color = Color.NAVY_BLUE
	# Set the collision mask based on where the card is coming from
	if magic_card.is_on_sale: # Came from store, look for hand drop area
		magic_card.set_drop_point_detector_mask(HAND_DROP_AREA_MASK)
		print("Dragging from store, looking for hand drop area (mask: %d)" % HAND_DROP_AREA_MASK)
	else: # Came from hand, look for store drop area
		magic_card.set_drop_point_detector_mask(CARD_DROP_AREA_MASK)
		print("Dragging from hand, looking for card drop area (mask: %d)" % CARD_DROP_AREA_MASK)

	minimum_drag_time_elapsed = false
	var threshold_timer := get_tree().create_timer(drag_minimum_threshold, false)
	threshold_timer.timeout.connect(func(): minimum_drag_time_elapsed = true)

func exit() -> void:
	# Reset mask or set appropriate mask for the resting state?
	# Let's reset it for now. The Base/OnSale states don't need detection.
	magic_card.set_drop_point_detector_mask(0)

func on_input(event: InputEvent) -> void:
	var single_targetd := magic_card.magic_resource.is_single_target()
	var mouse_motion := event is InputEventMouseMotion
	var cancel = event.is_action_pressed("right_mouse")
	# Use is_action_released for confirmation after dragging
	var confirm = event.is_action_released("left_mouse")

	if mouse_motion:
		magic_card.global_position = magic_card.get_global_mouse_position() - magic_card.pivot_offset
		# Transition to AIMING if needed (existing logic)
		if not magic_card.is_on_sale and single_targetd and magic_card.targets.size() > 0:
			get_viewport().set_input_as_handled()
			transition_requested.emit(self, MagicCardState.State.AIMING)

	if cancel:
		# Return to original state on cancel
		if magic_card.is_on_sale:
			transition_requested.emit(self, MagicCardState.State.ONSALE)
		else:
			transition_requested.emit(self, MagicCardState.State.BASE)
		return
	# Handle drop confirmation
	if minimum_drag_time_elapsed and confirm:
		print("magic_card.targets.size(): ", magic_card.targets.size())
		if magic_card.targets.size() == 0:
			if magic_card.is_on_sale:
				transition_requested.emit(self, MagicCardState.State.ONSALE)
			else:
				transition_requested.emit(self, MagicCardState.State.BASE)
			return
		get_viewport().set_input_as_handled()
		if magic_card.is_on_sale:
			transition_requested.emit(self, MagicCardState.State.BUYING)
		else:
			transition_requested.emit(self, MagicCardState.State.RELEASED)
		return

<!-- Read File: ui/magic_card/magic_card_state/magic_card_dragging_state.gd.uid -->
uid://c3p8pwwkouqux

<!-- Read File: ui/magic_card/magic_card_state/magic_card_on_sale_state.gd -->
extends MagicCardState

func enter() -> void:
	if not magic_card.is_node_ready():
		await magic_card.ready

	magic_card.is_on_sale = true
	magic_card.reparent_to_store_requested.emit(magic_card)
	magic_card.color.color = Color.WEB_MAROON
	magic_card.pivot_offset = Vector2.ZERO

func on_gui_input(event: InputEvent) -> void:
	if magic_card.is_on_sale and event.is_action_pressed("left_mouse"):
		magic_card.pivot_offset = magic_card.get_global_mouse_position() - magic_card.global_position
		transition_requested.emit(self, MagicCardState.State.CLICKED)
<!-- Read File: ui/magic_card/magic_card_state/magic_card_on_sale_state.gd.uid -->
uid://cj8rofst6gm1d

<!-- Read File: ui/magic_card/magic_card_state/magic_card_released_state.gd -->
extends MagicCardState

var played: bool

func enter() -> void:
	magic_card.color.color = Color.DARK_VIOLET
	played = false
	if not magic_card.targets.is_empty():
		played = true

func on_input(_event: InputEvent) -> void:
	if played:
		return
	transition_requested.emit(self, MagicCardState.State.BASE)
<!-- Read File: ui/magic_card/magic_card_state/magic_card_released_state.gd.uid -->
uid://cq8jhcv66ofyy

<!-- Read File: ui/magic_card/magic_card_state/magic_card_state.gd -->
extends Node
class_name MagicCardState

signal transition_requested(from: MagicCardState, to: State)

enum State {
	BASE,
	CLICKED,
	DRAGGING,
	AIMING,
	ONSALE,
	RELEASED,
	BUYING,
}

@export var state: State

var magic_card: MagicCard

func enter() -> void:
	pass

func exit() -> void:
	pass

func on_input(_event: InputEvent) -> void:
	pass

func on_gui_input(_event: InputEvent) -> void:
	pass

func on_mouse_entered() -> void:
	pass

func on_mouse_exited() -> void:
	pass

<!-- Read File: ui/magic_card/magic_card_state/magic_card_state.gd.uid -->
uid://boyoti3i3f2g0

<!-- Read File: ui/magic_card/magic_card_state_machine.gd -->
extends Node
class_name MagicCardStateMachine

@export var initial_state: MagicCardState

var current_state: MagicCardState
var states := {}
var magic_card: MagicCard
var parent: Node

func init(magic_card_node: MagicCard) -> void:
	for child in get_children():
		if child is MagicCardState:
			states[child.state] = child
			child.transition_requested.connect(_on_transition_requested)
			child.magic_card = magic_card_node
	if initial_state:
		initial_state.enter()
		current_state = initial_state

func on_input(event: InputEvent) -> void:
	if current_state:
		current_state.on_input(event)

func on_gui_input(event: InputEvent) -> void:
	if current_state:
		current_state.on_gui_input(event)

func on_mouse_entered() -> void:
	if current_state:
		current_state.on_mouse_entered()

func on_mouse_exited() -> void:
	if current_state:
		current_state.on_mouse_exited()

func _on_transition_requested(from: MagicCardState, to: MagicCardState.State) -> void:
	if from != current_state:
		return
	var new_state: MagicCardState = states[to]
	if not new_state:
		return
	if current_state:
		current_state.exit()
	new_state.enter()
	current_state = new_state

<!-- Read File: ui/magic_card/magic_card_state_machine.gd.uid -->
uid://bfqhskjsqaqik

<!-- Read File: ui/skill_display/skill_display.gd -->
extends Label

@export var description: String = "placeholder description"
# Store the skill resource if needed later
var skill: SkillResource = null

func _ready():
	# Initial setup using the exported description if no resource set yet
	tooltip_text = description
	# Optionally, set initial text if needed
	# text = "Skill Name" 

func set_skill_resource(new_skill_resource: SkillResource):
	skill = new_skill_resource
	if skill:
		# Directly access properties assuming they exist based on skill_resource definition
		text = skill.name if skill.name else "Unnamed Skill"
		tooltip_text = skill.description if skill.description else ""
		description = tooltip_text # Update the exported variable too, if desired
	else:
		# Handle cases where the resource is null
		text = "N/A"
		tooltip_text = ""
		description = ""

# Optional: Update description if edited in the inspector after resource is set
func _set(property, value):
	if property == "description":
		description = value
		# If a resource is set, maybe update the tooltip, or decide priority
		if not skill: 
			tooltip_text = description
		return true # Indicate the property was handled
	return false # Let Godot handle other properties

<!-- Read File: ui/skill_display/skill_display.gd.uid -->
uid://ctlo83jr24hm1


## User Task


我希望重构现有代码，请根据现有的代码按模块整理出重构计划

重构应该从小到大，每一个重构任务完成都应该可以正常运行项目。
