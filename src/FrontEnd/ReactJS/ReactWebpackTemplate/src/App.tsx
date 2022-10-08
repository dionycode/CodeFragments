import './styles.css'
import IMAGE from './logo-png.png'
import LOGO from './logo-svg.svg'
import { Counter } from './ClickCounter'

export const App = () => {
  return (
    <>
      <h1>
        Diony Code React Template - {process.env.NODE_ENV} - {process.env.name}
      </h1>
      <img src={IMAGE} alt="React Logo" width="300" height="300"></img>
      <img src={LOGO} alt="React Logo" width="300"></img> <Counter />
    </>
  )
}
