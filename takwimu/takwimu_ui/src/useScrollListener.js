import { useEffect, useState } from 'react';

export default function useScrollListener(
  threshold,
  comparison = '>',
  elementId = null
) {
  const [isOverThreshold, setIsOverThreshold] = useState(false);
  useEffect(() => {
    const handleScroll = () => {
      const scrollY = !elementId
        ? window.scrollY
        : document.getElementById(elementId).getBoundingClientRect().top;
      if (!isOverThreshold) {
        setIsOverThreshold(
          comparison === '<' ? scrollY < threshold : scrollY > threshold
        );
      } else if (isOverThreshold) {
        setIsOverThreshold(
          comparison === '<' ? scrollY < threshold : scrollY > threshold
        );
      }
    };
    window.addEventListener('scroll', handleScroll);
    return () => {
      window.removeEventListener('scroll', handleScroll);
    };
  }, [isOverThreshold]);

  return isOverThreshold;
}
