import * as React from 'react';
import AspectRatio from '@mui/joy/AspectRatio';
import Button from '@mui/joy/Button';
import Card from '@mui/joy/Card';
import CardContent from '@mui/joy/CardContent';
import IconButton from '@mui/joy/IconButton';
import Typography from '@mui/joy/Typography';
import BookmarkAdd from '@mui/icons-material/BookmarkAddOutlined';

var today = new Date();
var dd = String(today.getDate()).padStart(2, '0');
var mm = String(today.getMonth() + 1).padStart(2, '0');
var yyyy = today.getFullYear();
today = mm + '/' + dd + '/' + yyyy;

export default function PriceTag({ itemsNo, totalCost }) {
  return (
    <Card variant="outlined" sx={{ width: 320 }}>
      <div>
        <Typography level="h3" fontSize="md" sx={{ mb: 0.5 }}>
          Shopping Summary
        </Typography>
        <Typography level="body2">{today}</Typography>
        <IconButton
          aria-label="bookmark Bahamas Islands"
          variant="plain"
          color="neutral"
          size="sm"
          sx={{ position: 'absolute', top: '0.5rem', right: '0.5rem' }}
        >
          <BookmarkAdd />
        </IconButton>
      </div>
      <AspectRatio minHeight="120px" maxHeight="200px">
        <img
          src="https://i.pinimg.com/474x/b2/29/d4/b229d4531b370362e6a7398bca609f5d.jpg"
          loading="lazy"
          alt=""
        />
      </AspectRatio>
      <CardContent orientation="horizontal">
        <div>
          <Typography level="body3">Total price:</Typography>
          <Typography fontSize="lg" fontWeight="lg">
            ${totalCost}
          </Typography>
        </div>
        <div>
          <Typography level="body3">Total items:</Typography>
          <Typography fontSize="lg" fontWeight="lg">
            {itemsNo}
          </Typography>
        </div>
        <Button
          variant="solid"
          size="sm"
          color="primary"
          aria-label="Explore Bahamas Islands"
          sx={{ ml: 'auto', fontWeight: 600 }}
        >
          Shop
        </Button>
      </CardContent>
    </Card>
  );
}
