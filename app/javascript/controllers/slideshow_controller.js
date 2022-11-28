import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = [ "slide" ]
  static values = { index: { type: Number, default: 0 }}
  
  count() {
    const countInDiv = document.querySelectorAll('.chart-carousel').length;
    return countInDiv;
  }

  next() {
    this.indexValue == this.count()-1
      ? this.indexValue
      : this.indexValue++ 
  }

  previous() {
    this.indexValue == 0 
      ? this.indexValue 
      : this.indexValue--
  }

  indexValueChanged() {
    this.showCurrentSlide()
  }

  showCurrentSlide() {
    this.slideTargets.forEach((element, index) => {
      element.hidden = index != this.indexValue
    })
  }
}