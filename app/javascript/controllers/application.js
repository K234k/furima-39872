// app/javascript/controllers/application.js
import { Application } from "@hotwired/stimulus"
const application = Application.start()

// Stimulusのデバッグモードを設定（本番環境ではfalseにすることを推奨）
application.debug = false
window.Stimulus = application

// ここに具体的なコントローラーの登録を行う
// 例: application.register("controller-name", ControllerClass)

export { application }
