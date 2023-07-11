import './App.css';
import CreateItem from './components/CreateItem';
import ItemList from './components/ItemList';
import PriceTag from './components/PriceTag';
import { ApolloClient, InMemoryCache, ApolloProvider } from '@apollo/client';
import { Container, Grid, Box } from '@mui/material';
import Typography from '@mui/joy/Typography';

// Apollo Client setup for GraphQL API calls to the backend server 
const client = new ApolloClient({
  uri: '/data-api/graphql',
  cache: new InMemoryCache({
    addTypename: false
  })
});

function App() {
  return (
    <ApolloProvider client={client}>
       <Container maxWidth="lg" sx={{ padding:5 }}>
        <Typography level="h1" color="info" variant='outlined'>Smart Shopping Planner</Typography>
          <Grid item xs={12} md={6} sx={{ display: 'grid', gridTemplateColumns: '1fr 2fr 1fr', gap: '20px', paddingTop: '20px' }}>
          { <CreateItem />}
          { <ItemList />}
            <Box>
              { <PriceTag />}
            </Box>
          </Grid>
      </Container>
    </ApolloProvider>
  );
}

export default App;
