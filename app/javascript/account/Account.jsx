import React from 'react';
import AppBar from 'material-ui/AppBar';
import Avatar from 'material-ui/Avatar';

import { Grid, Row, Col } from 'react-flexbox-grid';

import Header from './Header';
import SideBar from './SideBar';
import Main from './Main';


class Account extends React.Component {
  constructor(props) {
    super(props);
    console.log(props);
  }
  render() {
    return (
      <div>
        <AppBar
          title="账号中心"
          iconClassNameRight="muidocs-icon-navigation-expand-more"
          iconElementRight={
            <Avatar src="https://o7h2xtq3g.qnssl.com/uploads/user/avatar/9ddec0bf-6de4-4bf3-9924-4b89d648e5c6/11457566__.png" />
          }
        />
        {/* <Header /> */}
        <Grid className="wrapper">
          <Row>
            <Col md={3}>
              <SideBar />
            </Col>
            <Col md={9}>
              <Main />
            </Col>
          </Row>
        </Grid>
      </div>
    );
  }
}

export default Account;
