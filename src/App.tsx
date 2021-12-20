/*import routesData from '@constants/routes.constant';
import { Routes, Route } from 'react-router-dom';
*/

import { SUITE } from './utils/envs';

/*
const App: React.FC = () => (
	<Routes>
		{routesData.map((route, i) => (
			<Route element={route.Component} key={`route_${i}`} path={route.url} />
		))}
	</Routes>
);
*/
const App: React.FC = () => (
	<div>
		<h2>
			You are running this application in <b>{process.env.NODE_ENV}</b> mode.
		</h2>
		<p>
			Admin Suite: <span style={{ color: 'blue' }}>{SUITE}</span>
		</p>
		<form>
			<input type="text" defaultValue={process.env.REACT_APP_NOT_SECRET_CODE} />
		</form>
	</div>
);

export default App;
