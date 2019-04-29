import { useEffect, useState } from 'react';

export default function useScrollListener(threshold) {
  const [isOverThreshold, setIsOverThreshold] = useState(false);
  useEffect(() => {
    const handleScroll = () => {
      if (window.scrollY > threshold && !isOverThreshold) {
        setIsOverThreshold(true);
      } else if (window.scrollY < threshold && isOverThreshold) {
        setIsOverThreshold(false);
      }
    };
    window.addEventListener('scroll', handleScroll);
    return () => {
      window.removeEventListener('scroll', handleScroll);
    };
  }, [isOverThreshold]);

  return isOverThreshold;
}
