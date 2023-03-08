// import { Controller } from "@hotwired/stimulus"

// // Connects to data-controller="dice-roller"
// export default class extends Controller {
//   static targets = ["bonus", "damagedicetype", "damagedicecount", "damagebonus", "attack"]
//   connect() {
//     console.log("Hello World!");
//     console.log(this.bonusTarget.value);
//     console.log(this.damagedicetypeTarget.value);
//     console.log(this.damagedicecountTarget.value);
//     console.log(this.damagebonusTarget.value);
//     console.log(this.attackTarget.value);
//   }

//   rolld(num) {
//     return Math.ceil( Math.random()*num );
//   }

//   add(x, y, z=0) { return parseInt(x) + parseInt(y) + parseInt(z); }

//   rollAll() {
//     console.log("Roll All")
//     let log = document.querySelector('#log');
//     let toHitBonus = parseInt(document.querySelector('#to-hit-bonus').value)
//     let damageBonus = parseInt(document.querySelector('#damage-bonus').value)
//     let numAttack = parseInt(document.querySelector('#attack-count').value)
//     let damageDice = parseInt(document.querySelector('#damage-dice').value)
//     let damageCount = parseInt(document.querySelector('#damage-dice-count').value)

//     for (let attack = 1; attack <= numAttack; attack++) {
//       let roll1 = rolld(20);
//       let roll2 = [];
//       for (let dd of Array(damageCount)) {
//         roll2.push(rolld(damageDice));
//       }
//       let topLog = `==========================<br>
//         Attack ${attack}:<br>
//         To Hit: (roll) ${roll1} + (bonus) ${toHitBonus} => ${roll1+toHitBonus}<br>
//         Damage: (roll) ${roll2} + (bonus) ${damageBonus} => ${roll2.reduce((tot, n)=>{ return tot+n})+damageBonus}<br> `;

//       log.insertAdjacentHTML('afterbegin', topLog);
//     }
//     save();
//   }

//   spacer() {
//     let log = document.querySelector('#log');
//     log.insertAdjacentHTML('afterbegin', '==========================<br><br>');
//     save();
//   }

//   clearLog() {
//     document.querySelector('#log').innerHTML = '';
//     document.querySelector('#undoClear').style.display = 'inline'
//   }

//   save() {
//     document.querySelector('#undoClear').style.display = 'none'

//     window.localStorage.setItem('diceRoller', JSON.stringify({
//       tohit: document.querySelector('#to-hit-bonus').value,
//       damagetype: document.querySelector('#damage-dice').value,
//       damagecount: document.querySelector('#damage-dice-count').value,
//       damagebonus: document.querySelector('#damage-bonus').value,
//       attackcount: document.querySelector('#attack-count').value,
//       log: document.querySelector('#log').innerHTML
//     }))
//   }

//   load() {
//     document.querySelector('#undoClear').style.display = 'none'

//     let savefile = JSON.parse(window.localStorage.getItem('diceRoller'));
//     document.querySelector('#to-hit-bonus').value = savefile.tohit;
//     document.querySelector('#damage-dice').value = savefile.damagetype;
//     document.querySelector('#damage-dice-count').value = savefile.damagecount;
//     document.querySelector('#damage-bonus').value = savefile.damagebonus;
//     document.querySelector('#attack-count').value = savefile.attackcount;
//     document.querySelector('#log').innerHTML = savefile.log
//   }

//   load()
// };



// // REGULAR JS

// console.log("dice roller connected")

// // DICE JS
// window.onload = (event) => {
//   const rolld = (num) => {
//     return Math.ceil( Math.random()*num );
//   }

//




// /////////////////////////////
import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dice-roller"

export default class extends Controller {
  static targets = [
    "log",
    "toHitBonus",
    "damageBonus",
    "numAttack",
    "damageDice",
    "damageCount",
  ]

  rollD(num) {
    return Math.ceil(Math.random() * num)
  }

  add(x, y, z = 0) {
    return parseInt(x) + parseInt(y) + parseInt(z)
  }

  connect() {
    this.load()
  }

  rollAll() {
    let topLog = ""
    let toHitBonus = parseInt(this.toHitBonusTarget.value)
    let damageBonus = parseInt(this.damageBonusTarget.value)
    let numAttack = parseInt(this.numAttackTarget.value)
    let damageDice = parseInt(this.damageDiceTarget.value)
    let damageCount = parseInt(this.damageCountTarget.value)

    for (let attack = 1; attack <= numAttack; attack++) {
      let roll1 = this.rollD(20)
      let roll2 = []
      for (let dd of Array(damageCount)) {
        roll2.push(this.rollD(damageDice))
      }
      topLog += `==========================<br>
        Attack ${attack}:<br>
        To Hit: (roll) ${roll1} + (bonus) ${toHitBonus} => ${
        roll1 + toHitBonus
      }<br>
        Damage: (roll) ${roll2} + (bonus) ${damageBonus} => ${
        roll2.reduce((tot, n) => {
          return tot + n
        }) + damageBonus
      }<br> `
    }

    this.logTarget.insertAdjacentHTML("afterbegin", topLog)
    this.save()
  }

  spacer() {
    this.logTarget.insertAdjacentHTML("afterbegin", "==========================<br><br>")
    this.save()
  }

  clearLog() {
    this.logTarget.innerHTML = ""
    this.element.querySelector("#undoClear").style.display = "inline"
  }

  save() {
    this.element.querySelector("#undoClear").style.display = "none"

    window.localStorage.setItem(
      "diceRoller",
      JSON.stringify({
        tohit: this.toHitBonusTarget.value,
        damagetype: this.damageDiceTarget.value,
        damagecount: this.damageCountTarget.value,
        damagebonus: this.damageBonusTarget.value,
        attackcount: this.numAttackTarget.value,
        log: this.logTarget.innerHTML,
      })
    )
  }


  load() {
    this.element.querySelector("#undoClear").style.display = "none"

    let savefile = JSON.parse(window.localStorage.getItem("diceRoller"))
    if (savefile) {
      this.toHitBonusTarget.value = savefile.tohit
      this.damageDiceTarget.value = savefile.damagetype
      this.damageCountTarget.value = savefile.damagecount
      this.damageBonusTarget.value = savefile.damagebonus
      this.numAttackTarget.value = savefile.attackcount
      this.logTarget.innerHTML = savefile.log
    }
  }
}
