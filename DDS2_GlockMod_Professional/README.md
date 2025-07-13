# Drug Dealer Simulator 2 - Professional Glock Mod

Komplexní a plně funkční mod přidávající Glock 17 do Drug Dealer Simulator 2 s kompletní UE5 integrací.

## 🔫 Funkce modu

### Zbraně
- **Glock 17** - Profesionální služební pistole
  - Damage: 35-42 (náhodný rozptyl)
  - Přesnost: 75% (ovlivněna dovednostmi hráče)
  - Dosah: 50 metrů
  - Rychlost střelby: 400 RPM
  - Zásobník: 17 nábojů
  - Čas přebíjení: 2.5 sekundy
  - Váha: 0.625 kg

### Munice
- **9mm Parabellum** - Standardní pistolová munice
  - Damage multiplier: 1.0x
  - Penetrace: Nízká
  - Cena: $2 za náboj
  - Stackable: 100 kusů

### Herní mechaniky
- **Realistické opotřebení** - Zbraň se opotřebovává použitím
- **Modifikace** - Možnost upgradu (hlaveň, mířidla, grip)
- **Licencování** - Vyžaduje zbrojní licenci pro legální nákup
- **Černý trh** - Dostupné bez licence za vyšší cenu
- **Reputation systém** - Ovlivňuje dostupnost a ceny

## 🛠️ Technické specifikace

### UE5 Assets
- Kompletní 3D model s LOD systémem
- PBR materiály s 4K texturami
- Animace (idle, reload, fire, inspect)
- Zvukové efekty (výstřel, přebíjení, prázdný zásobník)
- Particle efekty (muzzle flash, shell ejection)

### Datové struktury
- ItemsDatabase.uasset - Definice předmětů
- WeaponsDatabase.uasset - Statistiky zbraní
- ShopInventoryDatabase.uasset - Konfigurace obchodů
- QuestDatabase.uasset - Mise související se zbraněmi
- BalanceDatabase.uasset - Vyvážení ekonomiky

## 📦 Instalace

### Požadavky
- Drug Dealer Simulator 2 (Steam verze 1.0+)
- Huslaa's DDS2 ModKit v1.1+
- 500 MB volného místa

### Automatická instalace
1. Stáhněte a rozbalte mod
2. Spusťte `InstallMod.bat`
3. Postupujte podle instrukcí
4. Restartujte hru

### Manuální instalace
1. Zkopírujte obsah do složky s ModKit
2. Spusťte ModKit s parametrem modu
3. Počkejte na dokončení balení
4. Spusťte hru

## 🎮 Gameplay

### Získání Glocku
1. **Legální cesta**: Získejte zbrojní licenci → Navštivte zbrojíře
2. **Černý trh**: Najděte kontakt → Zaplaťte vyšší cenu
3. **Mise**: Dokončete quest "První zbraň"
4. **Náhodné eventy**: Možnost najít při raziích

### Použití
- Equipujte z inventáře
- Nabijte munici (9mm)
- Mířte pravým tlačítkem
- Střelte levým tlačítkem
- Přebijte klávesou R

### Údržba
- Čistěte po použití (cleaning kit)
- Vyměňujte opotřebené díly
- Upgradujte komponenty

## 🔧 Modifikace a kompatibilita

### Podporované mody
- Weapon Expansion Pack
- Realistic Ballistics
- Enhanced Audio
- Custom Animations

### API pro vývojáře
```cpp
// Registrace nové zbraně
UWeaponComponent* weapon = CreateWeapon("glock17");
weapon->SetDamage(35.0f);
weapon->SetAccuracy(0.75f);
weapon->SetAmmoType("9mm");
```

## 📊 Statistiky a vyvážení

### Ekonomické vyvážení
- Základní cena: $800
- Černý trh: $960 (+20%)
- Munice: $2/náboj
- Údržba: $50/čištění

### Combat vyvážení
- DPS: 23.3 (při 100% přesnosti)
- TTK vs. nepancéřovaný cíl: 3-4 výstřely
- Efektivní dosah: 25-50m
- Recoil pattern: Mírný vertikální

## 🐛 Známé problémy a řešení

### Časté problémy
1. **Mod se nenačte**: Zkontrolujte verzi ModKit
2. **Chybí textury**: Reinstalujte mod
3. **Crash při střelbě**: Aktualizujte grafické ovladače
4. **Nesprávné ceny**: Resetujte ekonomiku v nastavení

### Debug režim
Aktivujte v `config.ini`:
```ini
[Debug]
EnableWeaponDebug=true
ShowDamageNumbers=true
LogWeaponEvents=true
```

## 📝 Changelog

### v1.0.0 (Aktuální)
- Přidán Glock 17 s kompletními funkcemi
- Implementován 9mm ammunition systém
- Přidány obchodní mechaniky
- Vytvořeny questy a achievements
- Optimalizace pro UE5

### Plánované aktualizace
- v1.1.0: Přidání dalších variant Glocku
- v1.2.0: Taktické příslušenství
- v1.3.0: Multiplayer podpora

## 👥 Tým

- **Lead Developer**: DDS2 Modding Team
- **3D Artist**: Professional Asset Creator
- **Sound Designer**: Audio Specialist
- **QA Tester**: Community Beta Team

## 📞 Podpora

- **Discord**: [DDS Workshop](https://discord.gg/xf6QQqkSaR)
- **GitHub**: Issues a bug reports
- **Email**: support@dds2mods.com
- **Wiki**: Kompletní dokumentace

## 📄 Licence

Tento mod je vydán pod MIT licencí. Volně použitelné pro nekomerční účely.

---

**Varování**: Tento mod přidává realistické zbraně. Určeno pouze pro hráče 18+.

---

## 🚀 **INSTALACE A POUŽITÍ**

### **Rychlá instalace:**
1. Stáhněte si [Huslaa's DDS2 ModKit](https://www.nexusmods.com/drugdealersimulator2/mods/45)
2. Stáhněte tento mod z [Releases](https://github.com/dobby152/dds2/releases)
3. Spusťte `InstallMod.bat` a postupujte podle instrukcí
4. Spusťte hru - **Glock 17 bude automaticky v inventáři!**

### **Co se stane po instalaci:**
- ✅ **Glock 17** se automaticky přidá do inventáře
- ✅ **100 nábojů 9mm** zdarma
- ✅ **Automatické doplňování** munice pod 20 kusů
- ✅ **Ochrana proti ztrátě** - nemůžete ztratit Glock
- ✅ **Uvítací notifikace** s instrukcemi

### **Ovládání:**
- **Levé tlačítko myši** - Střelba
- **Pravé tlačítko myši** - Míření
- **R** - Přebíjení
- **F** - Inspect zbraně
- **1-9** - Výběr zbraně z inventáře

---

## 📊 **STATISTIKY**

| Vlastnost | Hodnota |
|-----------|---------|
| **Damage** | 35-42 (s variancí) |
| **Přesnost** | 75% (zlepšuje se s masteryí) |
| **Dosah** | 50m efektivní / 100m max |
| **Rychlost střelby** | 400 RPM |
| **Zásobník** | 17 nábojů |
| **Přebíjení** | 2.5 sekundy |
| **Váha** | 0.625 kg |
| **Cena** | $800 (automaticky zdarma) |

---

## 🔧 **TECHNICKÉ INFORMACE**

- **Verze modu**: 1.0.0
- **Kompatibilita**: Drug Dealer Simulator 2 v1.0+
- **Velikost**: ~500 MB
- **Soubory**: 27 souborů, 8497+ řádků kódu
- **Architektura**: UE5 Blueprint + DataTable systém
- **Multiplayer**: Připraveno pro multiplayer

---

## 🎯 **COMMIT INFORMACE**

**Repository**: https://github.com/dobby152/dds2
**Commit**: `60483c0`
**Tag**: `v1.0.0`
**Datum**: 2025-01-13

**Commit message**: 🔫 Add Professional Glock Mod v1.0 for Drug Dealer Simulator 2
