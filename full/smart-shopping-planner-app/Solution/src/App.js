import './App.css';
import CreateItem from './components/CreateItem';
import ItemList from './components/ItemList';
import PriceTag from './components/PriceTag';
import { Container, Grid, Box } from '@mui/material';
import Typography from '@mui/joy/Typography';
import React, { useState } from 'react';
import { totalItems, totalCost } from './utils/Utils'
import Loading from './components/Loading';


function App() {
  const [items, setItems] = useState([]);
  const [loading, setLoading] = useState(false);

  const fetchData = async () => {
    setLoading(true)
    try {
      const response = await fetch('/data-api/api/Item');
      if (!response.ok) {
        throw new Error(response.statusText);
      }
      const data = await response.json();
      setItems(data.value);
      setLoading(false);
    } catch (error) {
      console.log(error);
      setLoading(false);
    }
  };

  return (
      <Container maxWidth="lg" sx={{ padding: 5 }}>
        {loading && <Loading />}
        <Typography level="h1" color="info" variant='outlined'>Smart Shopping Planner</Typography>
        <Grid item xs={12} md={6} sx={{ display: 'grid', gridTemplateColumns: '1fr 2fr 1fr', gap: '20px', paddingTop: '20px' }}>
          {<CreateItem fetchData={fetchData} />}
          {<ItemList fetchData={fetchData} items={items} />}
          <Box>
            {<PriceTag itemsNo={totalItems(items)} totalCost={totalCost(items)} />}
          </Box>
        </Grid>
      </Container>
  );
}

export default App;
