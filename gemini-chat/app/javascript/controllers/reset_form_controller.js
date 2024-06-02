// from Abi: https://www.honeybadger.io/blog/chat-app-rails-actioncable-turbo/

import { Controller } from "stimulus"

export default class extends Controller {
    // todo ircc: rename abi-reset so i understand exactly how/whgere it works
  reset() {
    this.element.reset()
  }
}
